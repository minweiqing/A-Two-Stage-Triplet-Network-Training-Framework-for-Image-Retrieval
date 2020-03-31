# <p align="center">A Two-Stage Triplet Network Training Framework for Image Retrieval</p>

The image retrieval algorithm is implemented based on the matcovnet framework. The dataset is a classic dataset in the field of image retrieval. Oxford, Paris and Instre

This is a MATLAB toolbox that implements the training and testing of the approach described in our papers:



First, you need to install the base environment：

1. MATLAB (tested with MATLAB R2017a on Debian 8.1)
2. MatConvNet MATLAB toolbox version [1.0-beta25](http://www.vlfeat.org/matconvnet/download/matconvnet-1.0-beta25.tar.gz)

After installing the environment, you must first run the following code to import the required path：
run [MATCONVNET_ROOT]/matlab/vl_setupnn;
run [CNNIMAGERETRIEVAL_ROOT]/setup_cnnimageretrieval;

If you want to train the network, run the following code
train_cnnimageretrieval;

If you want to test the network, run the following code
test_cnnimageretrieval;


If you are interested in our work and want to cite it, please acknowledge the following paper:

@article{Min-DLRTN-TMM2020,
  title={A Two-Stage Triplet Network Training Framework for Image Retrieval},
  author={Min, Weiqing and Mei, Shuhuan and Li, Zhuo and Jiang, Shuqiang},
  journal={IEEE Transactions on Multimedia (Accepted)},
  year={2020},
}


