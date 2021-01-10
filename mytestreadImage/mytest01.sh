#!/bin/bash
str='http://www.zhao.com'
substr=${str#*//}
echo $substr
