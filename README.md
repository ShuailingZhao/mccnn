## Training and Test
#### Start testing
测试一对图像，可以按照官网github上的命令
```
./main.lua kitti fast -a predict -net_fname net/net_kitti_fast_-a_train_all.t7 -left samples/input/kittiL.png -right samples/input/kittiR.png -disp_max 70
luajit samples/bin2png.lua d h w #其中d,h,w分别为测试的图像的视差，高度，宽度
```
or
```
mytest.sh fast kittiL.png kittiR.png 70 h w #其中参数依次为模型的参数fast，图片名，视差，图像高，图像宽
```
测试多对图像，可以使用如下命令
```
./myreadtest.sh
```
## TODO next
+ 可以改写一下文件，现在还是.sh文件写的，不好用，可以写成.py写的文件
+ 好好规划下，把流程补充一下,包括需要安装的环境，训练步骤，预测步骤等

#### Start training
可以参考官网github的训练命令

## Coding Reference
+ [mccnn](https://github.com/jzbontar/mc-cnn)
