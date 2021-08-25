#include "a10.h"
#include <time.h>
#include <iostream>
#include <cmath>

#include <opencv2/opencv.hpp>

using namespace std;

//returns the difference between two images
Image calcDiff(const Image &img1, const Image &img2) {
    Image input1 = img1;
    Image input2 = img2;

    int width = input1.width();
    int height = input1.height();
    int channels = input1.channels();

    Image result = Image(width, height, channels);

    for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
            for (int z = 0; z < channels; z++) {
                result(x,y,z) = input2(x,y,z) - input1(x,y,z);
            }
        }
    }

    return result;
}


//return 16x16 px block with top left corner at x, y
Image createBlock(const Image &img1, int x, int y) {
    int channels = img1.channels();
    Image result = Image(16,16, channels);
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 16; j++) {
            for (int z = 0; z < channels; z++) {
                result(i,j,z) = img1.smartAccessor(x+i, y+j, z, true);
            }
        }
    }
    return result;
}


//compares block 1 with top left corner at x,y, with a 7px search window in img2 
//returns the displacement of the best matched pixel
Vec2f searchWindow(const Image &img1, const Image &img2, int x, int y) {
    Image block1 = createBlock(img1, x, y);
    Image block2 = createBlock(img2, x, y);

    int min = 10000;
    Vec2f pos(0,0);
    if (compareImage(block1, block2) < 0.1) {
        return pos;
    }

    for (int xx = -7; xx <= 7; xx++) {
        for (int yy = -7; yy <= 7; yy++) {
                block2 = createBlock(img2, x+xx, y+yy);       
                float diff = compareImage(block1, block2);
                if (diff < min) {
                    min = diff;
                    pos[0] = xx;
                    pos[1] = yy;
                    
                }
        }
    }
    return pos;
}


//return square difference betweeen pixels in img1 and img2
float compareImage(const Image &img1, const Image &img2) {
    int width = img2.width();
    int height = img2.height();
    int channels = img2.channels();

    float diff = 0.0;
    for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
            for (int z = 0; z < channels; z++) {    
                diff += pow((img2(x,y,z) - img1(x,y,z)), 2);
            }
        }
    }
    return diff;
}

//visualize a motion vector using Bresenham's line algorithm
Image visVector(const Image &img1, Vec2f pos){

    int x1 = 7;
    int y1 = 7;
    int x2 = (int) 7+pos[0];
    int y2 = (int) 7+pos[1];

    int dx0 = x2 - x1;

    int dy0 = y2 - y1;

    int dx = abs(x2 - x1);
    int dy = abs(y2 - y1);

    int px = 2 * dy - dx;
    int py = 2 * dx - dy;

    int x = 0;
    int y = 0;
    int xe = 0;
    int ye = 0;

    Image result = Image(16,16, img1.channels());

    if (dy <= dx) {
        if (dx0 >= 0) {
           x = x1;
           y = y1;
           xe = x2;
        }
        else {
            x = x2;
            y = y2;
            xe = x1;
        }
        result(x,y, 1) = 1;

        for (int i = 0; x < xe; i++) {
            x += 1;
            if (px < 0) {
                px = px + 2* dy;
            }
            else {
                if ((dx0 < 0 && dy0) || (dx0 > 0 && dy0 > 0)) {
                    y += 1;
                }
                else {
                    y -= 1;
                }
                px = px+2*(dy-dx);
            }
            result(x,y, 1) = 1;
        }
    }
    else {
        if (dy >= 0) {
            x = x1;
            y = y1;
            ye = x2;
        }
        else {
            x = x2;
            y = y2;
            ye = y1;
        }
        result(x,y,1) = 1;

        for (int i = 0; y < ye; i++) {
           y += 1; 
           if (py <= 0) {
                py = py+2*dx;
           }
           else {
                if((dx0<0 && dy0<0) || (dx0>0 && dy0>0)) {
                    x += 1;
                }
                else {
                    x -= 1;
                }
                py = py + 2*(dx-dy);
           }
           result(x,y,1) = 1;
        }
    }

    return result;
}



//visualize the change in motion between two frames
Image estMotion(const Image &img1, const Image &img2) {
    int width = img1.width();
    int height = img1.height();
    long int flag = 0;

    Image result = img2;
    for (int x = 0; x < width-16; x+= 16) {
        for (int y = 0; y < height-16; y+= 16) {
            Vec2f pos = searchWindow(img1, img2, x, y);
            // cout << "pos" << pos << endl;
            flag += log(abs(pos[0]) + abs(pos[1]) + 1); // before： flag += log(abs(pos[0]+1) + abs(pos[1]+1));

            //Draw motion vectors
            if (abs(pos[0]) > 0.000 || abs(pos[1]) > 0.000) {

                int x1 = x+7;
                int y1 = y+7;
                int x2 = (int) x1+pos[0];
                int y2 = (int) y1+pos[1];

                int dx0 = x2 - x1;
                int dy0 = y2 - y1;

                int dx = abs(x2 - x1);
                int dy = abs(y2 - y1);

                int px = 2 * dy - dx;
                int py = 2 * dx - dy;

                int xx = 0;
                int yy = 0;
                int xe = 0;
                int ye = 0;

                //mark end point in red
                result(x2, y2, 0) = 1;

                if (dy <= dx) {
                    if (dx0 >= 0) {
                       xx = x1;
                       yy = y1;
                       xe = x2;
                    }
                    else {
                        xx = x2;
                        yy = y2;
                        xe = x1;
                    }
                    if (xx >= 0 && xx < width && yy >= 0 && yy < height) {
                        result(xx,yy,2) = 1;
                    }
  
                    for (int i = 0; xx < xe; i++) {
                        xx += 1;
                        if (px < 0) {
                            px = px + 2* dy;
                        }
                        else {
                            if ((dx0 < 0 && dy0 < 0) || (dx0 > 0 && dy0 > 0)) {
                                yy += 1;
                            }
                            else {
                                yy -= 1;
                            }
                            px = px+2*(dy-dx);
                        }
                        if (xx >= 0 && xx < width && yy >= 0 && yy < height){
                            result(xx,yy,2) = 1;
                        }
                    }
                }
                
                else {
                    if (dy0 >= 0) {
                        xx = x1;
                        yy = y1;
                        ye = y2;
                    }
                    else {
                        xx = x2;
                        yy = y2;
                        ye = y1;
                    }
                    if (xx >= 0 && xx < width && yy >= 0 && yy < height){
                        result(xx,yy,2) = 1;
                    }
                    for (int i = 0; yy < ye; i++) {
                       yy += 1; 
                       if (py <= 0) {
                            py = py+2*dx;
                       }
                       else {
                            if((dx0<0 && dy0<0) || (dx0>0 && dy0>0)) {
                                xx += 1;
                            }
                            else {
                                xx -= 1;
                            }
                            py = py + 2*(dx-dy);
                       }
                      if (xx >= 0 && xx < width && yy >= 0 && yy < height){
                        result(xx,yy,2) = 1;
                      }
                    }
                }
            }
            //END draw vectors 
            
        }
    }
    cout<< "flag:" << flag << endl;

    return result;
}




motion_out detectMotionVector(const cv::Mat &frame1, const cv::Mat &frame2, int k , int size ,int thre ) {
    
    // int  k = 4;
    // int size = 6;
    // int thre = 5; 
    float thre_judge_shake = 0.5 * size * 1.43 ;

    int cnt = 0;
    float sum = 0;
    int width = frame1.cols;
    int height = frame1.rows;
    int scale = (width / 960) ;

    int step = scale * 2;
    int step2 = step * 2;
    int step3 = step * 3;
    k = k * scale ;
    size = size * scale;

    uchar *pre = frame1.data;
    uchar *cur = frame2.data;

    vector<vector<int>> vecs;
    vector<int> vecs_abs;
    
    for (int x = k ; x < width - k  -1 ; x += 2 * k + 1) {
        // cout << x <<"  |  "<< endl;
        for (int y = k ; y < height - k -1 ; y += 2 * k + 1) {

            int y0 = -1;
            int x0 = -1;

            float minVal = 255 * 255 * k * k ;
            // float minVal = 255 * 255 * k * k  ;

            float orinVal = 0 ;
            int cur_patch[4][4][3];

            for (int i = -k; i < k; i += step){
                for (int j = -k ; j < k ; j += step){

                    int x_i = (i + k) / step;
                    int y_i = (j + k) / step ;
                    
                    cur_patch[x_i][y_i][0] = cur[((y + j) * width + (x + i)) * 3  ] ;
                    // cur_patch[x_i][y_i][1] = cur[((y + j) * width + (x + i)) * 3 + 1] ;
                    // cur_patch[x_i][y_i][2] = cur[((y + j) * width + (x + i)) * 3 + 2] ;
                }
            }


            for (int x_ = x - size  ; x_ < x + size  ; x_ += step){

                for (int y_ = y - size   ; y_ < y + size  ; y_ += step){

                    if ( (x_ < k) || (x_ >= width - k) || (y_ < k) || (y_ >= height - k) ){
                        continue;
                    }
                    
                    int mse = 0;
                    
                    for (int i = -k; i < k; i += step){

                        int x_i = (i + k) / step ;

                        int dr1 = cur_patch[x_i][0][0] - pre[((y_ - k) * width + (x_ + i)) * 3  ];
                        // int dg1 = cur_patch[x_i][0][1] - pre[((y_ - k) * width + (x_ + i)) * 3 + 1];
                        // int db1 = cur_patch[x_i][0][2] - pre[((y_ - k) * width + (x_ + i)) * 3 + 2];

                        int dr2 = cur_patch[x_i][1][0] - pre[((y_ - k + step) * width + (x_ + i)) * 3 ];
                        // int dg2 = cur_patch[x_i][1][1] - pre[((y_ - k + 2) * width + (x_ + i)) * 3 +1];
                        // int db2 = cur_patch[x_i][1][2] - pre[((y_ - k + 2) * width + (x_ + i)) * 3 +2];

                        int dr3 = cur_patch[x_i][2][0] - pre[((y_ - k + step2) * width + (x_ + i)) * 3 ];
                        // int dg3 = cur_patch[x_i][2][1] - pre[((y_ - k + 4) * width + (x_ + i)) * 3 +1];
                        // int db3 = cur_patch[x_i][2][2] - pre[((y_ - k + 4) * width + (x_ + i)) * 3 +2];

                        int dr4 = cur_patch[x_i][3][0] - pre[((y_ - k + step3) * width + (x_ + i)) * 3 ];
                        // int dg4 = cur_patch[x_i][3][1] - pre[((y_ - k + 6) * width + (x_ + i)) * 3 +1];
                        // int db4 = cur_patch[x_i][3][2] - pre[((y_ - k + 6) * width + (x_ + i)) * 3 +2];
 
                        mse = mse + dr1 * dr1 + dr2 * dr2 + dr3 * dr3 + dr4 * dr4;
                        // mse = mse + dr1 * dr1 ;
                        // mse =  mse + (dr1 * dr1 + dg1 * dg1 + db1 * db1) + (dr2 * dr2 + dg2 * dg2 + db2 * db2) + (dr3 * dr3 + dg3 * dg3 + db3 * db3) ;

                    }
                    // cout << mse << "mse/minVal"<< minVal << endl;

                    if ( mse <= minVal) {

                        minVal = mse;
                        x0 = x_;
                        y0 = y_;
                    }

                    if (x == x_ and y == y_) {
                        orinVal = mse;
                    }
                }
            }
            
            int p = thre * thre *  4 * 4  ;
            // cout << minVal << " " << p <<endl;

            if (minVal == orinVal || minVal <  p){

                x0 = x;
                y0 = y;
            }

            //Caculate abs of motion vector 
            // float vec_abs =  sqrt((x - x0) * (x - x0) + (y - y0 ) * (y - y0) );  
            float vec_abs =  abs(x - x0) + abs(y - y0 );  
            
            if (vec_abs > 0 && x0 != -1  && y0 !=-1 ){

                // cout << " x:" << x << " y:" << y << " x0:" << x0 << " y0:" << y0 <<endl;
                vector<int> vec;

                vec.push_back(x);
                vec.push_back(y);
                vec.push_back(x0);
                vec.push_back(y0);

                vecs.push_back(vec);
                vec.clear();
                vecs_abs.push_back(vec_abs);
                
                }      

            //Caculate sum/cnt to judge shake
            if (vec_abs <= thre_judge_shake){
                cnt += 1;
                sum = sum + vec_abs;
                
            }

        }
    }
    float sum_ = sum/cnt;
    // cout << "sum_: " << sum_ <<endl;
    
    motion_out output ;
    output.vect = vecs;
    output.abs = vecs_abs;
    output.judge = sum_;


    return output;// , vecs_abs , sum_;
}

cv::Mat arrowdraw(cv::Mat mat, int x1 ,int y1 ,int x2 ,int y2){
    double radians = atan2( x1 - x2 , y2 - y1 ) ;
    int x11 = 0;
    int y11 = 0;
    int x12 = -2;
    int y12 = -2;
    int u11 = 0;
    int v11 = 0;
    int u12 = 2;
    int v12 = -2;
    double x11_ = x11 * cos(radians) - y11 * sin(radians) + x2;
    double y11_ = x11 * sin(radians) + y11 * cos(radians) + y2;
    double x12_ = x12 * cos(radians) - y12 * sin(radians) + x2;
    double y12_ = x12 * sin(radians) + y12 * cos(radians) + y2;
    double u11_ = u11 * cos(radians) - v11 * sin(radians) + x2;
    double v11_ = u11 * sin(radians) + v11 * cos(radians) + y2;
    double u12_ = u12 * cos(radians) - v12 * sin(radians) + x2;
    double v12_ = u12 * sin(radians) + v12 * cos(radians) + y2;
    
    cv::Point p0 = cv::Point(x1,y1);
    cv::Point p1 = cv::Point(x2, y2);
    cv::Point p2 = cv::Point(x11_,y11_);
    cv::Point p3 = cv::Point(x12_, y12_);
    cv::Point p4 = cv::Point(u11_,v11_);
    cv::Point p5 = cv::Point(u12_, v12_);

    cv::line(mat, p0, p1, cv::Scalar(255, 255, 255), 0.1, 8);
    cv::line(mat, p2, p3, cv::Scalar(255, 255, 255), 0.1, 8);
    cv::line(mat, p4, p5, cv::Scalar(255, 255, 255), 0.1, 8);

    return mat;

}