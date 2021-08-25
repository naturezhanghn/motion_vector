import cv2
import numpy as np
import glob


# frameSize = (1920, 1080)
frameSize = (960, 540)

out = cv2.VideoWriter('/workspace/mnt/storage/zhangziran/zhangzr2/project/OutputVideo/d1_out.avi',cv2.VideoWriter_fourcc('X', 'V', 'I', 'D'), 25, frameSize)
cnt = 0
for filename in sorted(glob.glob('/workspace/mnt/storage/zhangziran/zhangzr2/project/motion_vector/Output_3type_d1/*.png')):
    img = cv2.imread(filename)
    img_resize = cv2.resize(img,frameSize)
    out.write( img_resize)
    print("success{}:".format(filename))
    # cnt +=1
    # if cnt > 2000:
    #     break

out.release()


#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/7/2 13:32
# @Author  : xiaodai
# -*- coding: UTF-8 -*-
# import os
# import cv2
# from tqdm import tqdm
# from multiprocessing import Pool




# # 图片合成视频
# def pic_to_video(path,save_path,time_dir):
#     filelist = os.listdir(path) #获取该目录下的所有文件名
#     writer = None
#     print('-------->',path,save_path)
#     cnt = 0 
#     for item in tqdm(filelist):
#         cnt = cnt +1
#         if item.endswith('.png'):   #判断图片后缀是否是.jpg
#             item = path + '/' + item
#             print(item)
#             img = cv2.imread(item)  #使用opencv读取图像，直接返回numpy.ndarray 对象，通道顺序为BGR ，注意是BGR，通道值默认范围0-255。
#             if writer is None:
#                 fourcc = cv2.VideoWriter_fourcc(*"MJPG")
#                 writer = cv2.VideoWriter(save_path+'/'+time_dir+'.mp4', fourcc, 25,
#                                      (img.shape[1], img.shape[0]), True)
#             if writer is not None:
#                 writer.write(img)
#         if cnt == 100 :
#             break

# if __name__ == '__main__':
#     org_path = r"/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/project/motion_estimation-master_v1/Output"
#     p = Pool(8)
#     path = os.path.join(org_path)
#     print(path)
#     save_path = "/workspace/mnt/storage/zhangziran/zhangzr/motion_vector/test/outputvideo"
#     os.makedirs(save_path,exist_ok=True)
#     time_dir = "aa"
#     p.apply_async(pic_to_video, args=(path, save_path,time_dir))
#     p.close()
#     p.join()
