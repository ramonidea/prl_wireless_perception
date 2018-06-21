#!/usr/bin/env python
import message_filters
from sensor_msgs.msg import Image
from rgbd_message.msg import rgbd
import rospy
import zlib
import numpy as np
import cv2
from cv_bridge import CvBridge, CvBridgeError

#TODO:Make dynamic param
RGB_COMPRESS = 75

def callback(rgb, dep):
    global pub, bridge, RGB_COMPRESS
    rgbd_msg = rgbd()
    rgbd_msg.header = dep.header

    try:
        rgb_data = bridge.imgmsg_to_cv2(rgb , "rgb8")
    except CvBridgeError as e:
        print(e)
    encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), RGB_COMPRESS]
    ret, rgb_compressed = cv2.imencode('.jpg', rgb_data, encode_param)
    rgb_compressed = rgb_compressed.tobytes()

    try:
        dep_data = bridge.imgmsg_to_cv2(dep , "16UC1") 
    except CvBridgeError as e:
        print(e)
    #Trim down to 1d Array
    dep_compressed = zlib.compress(dep_data)

    final_compressed = rgb_compressed + b'ColDep'+ dep_compressed

    rgbd_msg.data = final_compressed

    pub.publish(rgbd_msg)



if __name__ == '__main__':
    bridge = CvBridge()

    rgb_sub = message_filters.Subscriber('/camera/color/image_raw', Image)
    dep_sub = message_filters.Subscriber('/camera/aligned_depth_to_color/image_raw', Image)
    ts = message_filters.TimeSynchronizer([rgb_sub, dep_sub], 20)

    pub = rospy.Publisher('/camera/rgbd', rgbd, queue_size=20)
    rospy.init_node('Compressor', anonymous=False)

    ts.registerCallback(callback)

    rospy.spin()
