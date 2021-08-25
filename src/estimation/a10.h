
#ifndef __a10__h
#define __a10__h

#include <cmath>
#include <iostream>

#include "../common/matrix.h"
#include "../common/Image.h"
#include "filtering.h"
#include <cstdlib>
#include <string>
#include <opencv2/opencv.hpp>

using namespace std;


struct motion_out {
        //vector is 
        vector<vector<int>> vect;
        vector<int> abs; 
        float  judge;
    };

Image calcDiff(const Image &img1, const Image &img2);
Image createBlock(const Image &img1, int x, int y);
Image estMotion(const Image &img1, const Image &img2);
Image visVector(const Image &img1, Vec2f pos);

Vec2f  searchWindow(const Image &img1, const Image &img2, int x, int y);
float compareImage(const Image &img1, const Image &img2);

motion_out detectMotionVector(const cv::Mat &pre1, const cv::Mat &cur1,int k=4,int size=6 ,int thre=5 );
cv::Mat arrowdraw(cv::Mat mat, int x1 ,int y1 ,int x2 ,int y2);

#endif
