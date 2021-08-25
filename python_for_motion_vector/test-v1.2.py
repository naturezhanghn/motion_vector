import cv2
import numpy as np
import math
import os
import time

# 4, 8, 5, 0.5 : 40s : 

k = 4
size = 8
thre = 5
thre_judge_shake = 0.5 * ( size * np.sqrt(2) )

def arrowdraw (img, x1, y1, x2, y2) :
    radians = math.atan2(x1 - x2, y2 - y1)
    x11 = 0
    y11 = 0
    x12 = -2
    y12 = -2
    u11 = 0
    v11 = 0
    u12 = 2
    v12 = -2
    x11_ = x11 * math.cos(radians) - y11 * math.sin(radians) + x2
    y11_ = x11 * math.sin(radians) + y11 * math.cos(radians) + y2
    x12_ = x12 * math.cos(radians) - y12 * math.sin(radians) + x2
    y12_ = x12 * math.sin(radians) + y12 * math.cos(radians) + y2
    u11_ = u11 * math.cos(radians) - v11 * math.sin(radians) + x2
    v11_ = u11 * math.sin(radians) + v11 * math.cos(radians) + y2
    u12_ = u12 * math.cos(radians) - v12 * math.sin(radians) + x2
    v12_ = u12 * math.sin(radians) + v12 * math.cos(radians) + y2
    img = cv2.line(img, (x1, y1) ,(x2, y2) ,(255, 255, 255 ), 1)
    img = cv2.line(img, (int(x11_) ,int(y11_)), (int(x12_) ,int(y12_)), (255, 255, 255), 1)
    img = cv2.line(img, (int(u11_), int(v11_)), (int(u12_), int(v12_)) , (255, 255, 255), 1)
    
    return img

def visualizeBoundary(img, frame):
    
    kernel = np.ones((10,10),np.uint8)
    dilation = cv2.dilate(img,kernel,iterations = 1)
    erosion = cv2.erode(dilation,kernel,iterations = 1)
    (_, cnts, _) = cv2.findContours(erosion.copy(), cv2.RETR_EXTERNAL,
    cv2.CHAIN_APPROX_SIMPLE)
    for c in cnts:
        rect = cv2.boundingRect(c)
        if rect[2] <= 2 * k + 1 or rect[3] < 2 * k + 1: continue
        
        x,y,w,h = rect
        cv2.rectangle(frame,(x,y),(x+w,y+h),(0,255,0),2)
    
    return frame

def detectMotionVector(pre, cur) : 
    
    start = time.time()

    vecs = []
    vecs1 = [] 
    cnt = 0
    sum = 0
    h = pre.shape[1]
    w = pre.shape[0]
    
    for x in range(k, w - k - 1, 2 * k + 1):
        print(x)
        for y in range(k, h - k - 1, 2 * k + 1):
             
            x0 = -1
            y0 = -1
                        
            minVal = 255 * 255 * k * k
            orinVal = 0
            for x_ in range(x - size, x + size, 2):
                for y_ in range(y - size, y + size, 2):
                    
                    if (x_ < k or x_ >= w - k or y_ < k or y_ >= h - k):
                        continue
                    
                    sum2 = 0
                    
                    for i in range(-k, k, 3):
                        for j in range(-k, k, 3):
                            r = cur[x + i, y + j, 0]
                            g = cur[x + i, y + j, 1]
                            b = cur[x + i, y + j, 2]
                            r_ = pre[x_ + i, y_ + j, 0]
                            g_ = pre[x_ + i, y_ + j, 1]
                            b_ = pre[x_ + i, y_ + j, 2]
                            
                            sum2 = sum2 + (r - r_) * (r - r_) + (g - g_) * (g - g_) + (b - b_) * (b - b_)
                            # sum2 = sum2 + abs(r - r_) #+ abs(g - g_)  + abs(b - b_)  
                    if sum2 < minVal:
                        minVal = sum2
                        x0 = x_
                        y0 = y_
                    
                    if (x == x_ and y == y_):
                        orinVal = sum2
            
            if minVal == orinVal or minVal < thre * thre * 3 * k * k:
            # if minVal == orinVal or minVal < 0.1:#thre  * k/5 :#* k:
                x0 = x
                y0 = y
                            
            vec = [x, y, x0, y0]
            vec1 = np.int(np.sqrt(( x - x0 ) * ( x - x0 ) + ( y - y0) * ( y - y0 ) ))
            # if vec1>5:
            vecs.append(vec)
            vecs1.append(vec1)
            if vec1 < thre_judge_shake: 
                cnt = cnt + 1
                sum = sum + vec1
            
             
    end = time.time()
    print(end - start)
    return vecs , vecs1,  sum/cnt 

num = 3
data_path = "/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/data/dataset_480_270/"
save_path = "/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/test/test_motion_vector/threading_test/"
os.makedirs(save_path,  exist_ok = True)

def main():    
    average_motion = []
    vectabs_motion =[]

    for i in range(58550,59950,30): 
        vecs_abs = []
        aver_i = []
        avers = 0 
        for j in range(1,27,2):
            
        # if (len(vecs_abs) > (i-j+1)) and (vecs_abs[i-j+1] is None):
            frame0 = cv2.imread(data_path+"a"+str(num)+"/a"+str(num)+"_"+str(-j+i)+".png")
            frame1 = cv2.imread(data_path+"a"+str(num)+"/a"+str(num)+"_"+str(-j+i+1)+".png")
            vecs , vecs_abs, aver_i = detectMotionVector(frame1, frame0)
            avers += aver_i/13

            if j == 1:
                vecs_out = vecs
                vecs_abs_out = vecs_abs
                rlt = frame0.copy()
       
        average_motion.append('frame'+str(i)+":") 
        average_motion.append(avers) 
        # average_motion.append('\n') 
        
        vectabs_motion.append('frame'+str(i)+":")
        vectabs_motion.append(vecs_abs_out)
        # vectabs_motion.append('\n') 
         

        for vec in vecs_out :
            if (vec[1] == vec[3] and vec[0] == vec[2]):
                continue
            rlt = arrowdraw(rlt, vec[1], vec[0], vec[3], vec[2])
            # cv2.rectangle(rlt_bianry, (vec[3] - k, vec[2] - k), (vec[3] + k, vec[2] + k), (255, 255, 255), -1)

        cv2.putText(rlt, str(avers), (10, 20), cv2.FONT_HERSHEY_COMPLEX, 0.5, (0, 0, 0), 1)
        cv2.imwrite(os.path.join(save_path, 'mv'+str(i)+'.bmp'),rlt)
        print(os.path.join(save_path, 'mv'+str(i)+'.bmp'))

    f=open(os.path.join(save_path,"59300-average.txt"),"w")
    for line in average_motion:
        f.write(str(line)+'\n')
        #f.write(str(average_motion))
    f.close()

    f=open(os.path.join(save_path,"59300-abs_vector.txt"),"w")
    for line in vectabs_motion:
        f.write(str(line)+'\n')
        #f.write(str(average_motion))
    f.close()

# main()


import threading
R = threading.Lock()


if __name__ == '__main__':
    thread_list = []
    # vid_list = range(1, 220)
    # num = 1
    thrd = 5
    for i in range(thrd):
        f1 = threading.Thread(target=main, )
        f1.setDaemon(True)
        thread_list.append(f1)
        f1.start()
    for i in thread_list:
        i.join()

