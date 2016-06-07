//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


/*
 
 global queues already created by iOS:
 
 QOS_CLASS_USER_INTERACTIVE
 
 QOS_CLASS_USER_INITIATED
 
 QOS_CLASS_UTILITY
 
 QOS_CLASS_BACKGROUND
 
 
 concurrent queues, based on how many cores your system has, the number of threads that can be working on your stuff at the same time
 AKA NSURLSession, also the four QOS ones above. there are/can be others.
 
 
 */