#!/bin/bash
./main.lua $1 fast -a predict -net_fname net/net_kitti_fast_-a_train_all.t7 -left samples/input/$2 -right samples/input/$3 -disp_max $4
luajit samples/bin2png.lua $4 $5 $6
