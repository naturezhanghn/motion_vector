#include "../estimation/a10.h"
#include <iostream>
#include <opencv2/opencv.hpp>
#include<time.h>

using namespace std;

// void testConstDiff() {
//     cout << "frame1:" << frame1 << endl;
//     Image img1 = Image(frame1);
    
//     Image img2 = Image( frame2);
//     Image result = calcDiff(img1, img2);
//     result.write(out + "diff"+ to_string(n) +".png");
//     return;
// }

// void testCompareImage() {
//     Image img1 = Image(frame1);
//     Image img2 = Image(frame2);
//     float diff = compareImage(img1, img2);
//     cout << "Difference between images: " << diff << endl;
//     return;
// }

// void testCreateBlock() {
//     Image img1 = Image(frame1);
//     Image result = createBlock(img1, 50, 50);
//     result.write(out + "block.png");
//     cout << "16 x 16 px block created" << endl;
//     return;
// }

// void testSearchWindow() {
//     Image img1 = Image(frame1);
//     Image img2 = Image(frame2);

//     Vec2f pos = searchWindow(img1, img2, 100, 100);
//     Image block1 = createBlock(img1, 100, 100);
//     Image block2 = createBlock(img2, pos[0] + 100, pos[1] + 100);

//     block1.write(out + "block1.png");
//     block2.write(out + "block2.png");
//     float diff = compareImage(block1, block2);
//     cout << "Difference between blocks: " << diff << endl;
// }

// void testEstMotion() {

//     for (int i = 4750; i < 4798; i++) {
        
//         //string s1 = "Input/Dalmations/frame_";
//         //string s2 = "Input/Dalmations/frame_";
//         string s1 = "/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/data/dataset_480_270/a4/a4_";
//         string s2 = "/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/data/dataset_480_270/a4/a4_";

//         s1.append(to_string(i));
//         s2.append(to_string(i+1));
//         s1.append(".png");
//         s2.append(".png");
//         // cout << "s1: " << s1 << endl;
//         // cout << "s1: " << s2 << endl;

//         Image img1 = Image(s1);
//         Image img2 = Image(s2);


//         Image result = estMotion(img1, img2);
//         string res = "/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master/Output/";
//         res.append(to_string(i));
//         res.append(".png");
//         result.write(res);
//         cout << "Output: " << res << endl;
        
//     }

//     cout << "Image rendered" << endl;
// }

// void testVisVector() {
//     Image img1 = Image(frame1);
//     Vec2f pos;
//     pos[0] = -7.0f;
//     pos[1] = -7.0f;
//     Image result = visVector(img1, pos);
//     result.write(out + "testVisualization.png");
//     cout << "vector field rendered" << endl;
// }


// void testMotionVector() {
//     cv::Mat img1 = cv::imread(frame1);
//     cv::Mat img2 = cv::imread(frame2);

//     cv::Mat mat = cv::imread(frame1);

//     motion_out motion = detectMotionVector(img2, img1);

//     float judge = motion.judge;
//     vector<vector<int>> vect = motion.vect;

//     for(int i=0;i<vect.size();i++) {

//         mat = arrowdraw( mat, vect[i][0] ,vect[i][1] , vect[i][2], vect[i][3]);
//     }
//     cv::imwrite(out + "motion_vector"+ to_string(n) +".png", mat);

//     // cout << "diff:" << diff.vect[20][20] << endl;
//     return ;

// }
int cnt = 0;
int flag = 0;
float thred_up = 0.6;
float thred_down =  0.3;
string out =  "/workspace/mnt/storage/zhangziran/zhangzr2/project/motion_vector/Output_3type_d1/";
void testMotionVectorBatch(const string &frame1 ,const string &frame2, int  n,int d ) {
    cv::Mat img1 = cv::imread(frame1);
    cv::Mat img2 = cv::imread(frame2);
    
    int w = img1.cols;
    int h = img1.rows;

    int x0 = w/2;
    int y0 = h/2;

    clock_t start,end;

    motion_out motion = detectMotionVector(img2, img1);
    float judge = motion.judge;
   

    vector<vector<int>> vect = motion.vect;
    

    float zoom_judge = 0;
    for(int i=0;i<vect.size();i++) {

        img1 = arrowdraw( img1, vect[i][0] ,vect[i][1], vect[i][2], vect[i][3]);
    }


    if (vect.size() > 2000 ) {
        for(int i=0;i<vect.size();i++) {

                int x1 = vect[i][0];
                int y1 = vect[i][1];
                int x2 = vect[i][2];
                int y2 = vect[i][3];
                int vx1 = x2 - x1;
                int vy1 = y2 - y1;
                int vx0 = x1 - x0;
                int vy0 = y1 - y0;

                float projectioni = (vx1 * vx0 + vy1 * vy0) / sqrt(vx0 * vx0 + vy0 * vy0 );
                zoom_judge += projectioni;

                img1 = arrowdraw( img1, x1 ,y1 , x2, y2);
            }
            zoom_judge = zoom_judge/vect.size();
            // cout<< "zoom_judge:"<< zoom_judge <<endl;
    }
            

    
    if (judge > thred_down ){
            cnt = 5;
        }


    if (judge > thred_up  ){
        if (flag < 15){
            flag ++;
        }
    }
    else if (flag > 0 && judge > thred_down && judge <= thred_up )
    {
       flag --;
    }
    else{
        flag = 0;
    }

    if (zoom_judge > 1.5){
            cv::putText(img1,to_string(3)+" zoom in" ,cv::Point(20,50),cv::FONT_HERSHEY_DUPLEX,2,cv::Scalar(0,255,0),2,false);
        }
    else if (zoom_judge < -2){
        cv::putText(img1,to_string(4)+" zoom out" ,cv::Point(20,50),cv::FONT_HERSHEY_DUPLEX,2,cv::Scalar(0,255,0),2,false);
    }
    else{
        if ( flag <= 1.5 ){
            
            if (cnt > 0 ){
                cv::putText(img1,to_string(1) ,cv::Point(20,50),cv::FONT_HERSHEY_DUPLEX,2,cv::Scalar(0,255,0),2,false);
                cnt--;
            }
            else {
                cv::putText(img1,to_string(0) ,cv::Point(20,50),cv::FONT_HERSHEY_DUPLEX,2,cv::Scalar(0,255,0),2,false);
            }  
        }
  
        // if( flag > 5 ){
        else{ 
            cv::putText(img1,to_string(2) ,cv::Point(20,50),cv::FONT_HERSHEY_DUPLEX,2,cv::Scalar(0,255,0),2,false);
        }
    }

    

    cout << "successful:" << n <<"   judge:" << judge << "   vector_size:"<< vect.size()<<endl;

    stringstream ss;
    ss << setw(5) << setfill('0') << n;
    string str;
    ss >> str;         //将字符流传给 str

    cv::imwrite(out + "motion_vector"+ str +".png", img1);

    return ;

}

// int main() {
//     // testConstDiff();
//     // testCompareImage();
//     // testCreateBlock();
//     // testSearchWindow();
//     testEstMotion();
//     // testVisVector();

//     return 0;
// }



int main() {
    // testConstDiff();
    string tp = "d"; 
    int video_num = 1;
    // int n = 4490;
    int d = 1;
    for (int n = 1 ;n <1210; n++){
    // for (int n = 3800 ;n <= 4000; n++){
    // for (int n = 3800 ;n <= 3850; n++){
    // for (int n = 300 ;n <= 400; n++){

        string frame1 = "/workspace/mnt/storage/zhangziran/zhangzr2/project/DATA/dataset/"+ tp + to_string(video_num) + "/"+ tp + to_string(video_num) +"_" + to_string(n) + ".png";
        string frame2 = "/workspace/mnt/storage/zhangziran/zhangzr2/project/DATA/dataset/"+ tp + to_string(video_num) + "/"+ tp + to_string(video_num) +"_" + to_string(n+d) + ".png";
        string out =  "/workspace/mnt/storage/zhangziran/zhangzr2/project/motion_vector/Output_3type_d1/";

        clock_t start,end;//定义clock_t变量
        start = clock();//开始时间
        testMotionVectorBatch(frame1,frame2,n,d);
        end = clock();   //结束时间
        cout<<"time = "<<double(end-start)/CLOCKS_PER_SEC<<"s"<<endl;  //输出时间（单位：ｓ）

        }
    return 0;

}
