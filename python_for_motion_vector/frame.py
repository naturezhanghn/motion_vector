import cv2
import os
def save_img():
    video_path = r'/workspace/mnt/storage/zhangziran/zhangzr2/project/DATA/Video/'
    save_path = r"/workspace/mnt/storage/zhangziran/zhangzr2/project/DATA/dataset/"
    videos = os.listdir(video_path)
    for video_name in videos:
        file_name = video_name.split('.')[0]
        if file_name != 'd1':
            print(file_name)
            continue
        # print("---")

        folder_name = save_path + file_name
        os.makedirs(folder_name,exist_ok=True)
        vc = cv2.VideoCapture(video_path+video_name) #读入视频文件
        c=0
        rval=vc.isOpened()

        while rval:   #循环读取视频帧
            rval, frame = vc.read()
            c = c + 1
            # if c<5000:
            #     continue
            if c > 0:
                # rval, frame = vc.read()
                pic_path = folder_name+'/'
                if rval:
                    cv2.imwrite(pic_path + file_name + '_' + str(c) + '.png', frame) #存储为图像,保存名为 文件夹名_数字（第几个文件）.jpg
                    cv2.waitKey(1)
                else:
                    break
                print(c)
            # if c == 5000:
            #     rval = 0
            

        vc.release()
        print('save_success')
        print(folder_name)
save_img()