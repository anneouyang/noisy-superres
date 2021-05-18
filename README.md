# Noisy Super-Resolution
Experiments with different super-resolution and denoising techniques to determine a method that yields the highest image quality



- SRGAN code based on https://github.com/Lornatang/SRGAN-PyTorch
- ESRGAN code based on https://github.com/Lornatang/ESRGAN-PyTorch
- DIDN code based on https://github.com/SonghyunYu/DIDN


### How to obtain data

```text
cd data
sh download_dataset.sh
```       

### How to Train Models
To train noisySRGAN, we run 
```text
cd SRGAN_Pytorch
python train.py -a srgan --gpu 0 --pretrained --add-noise 1 --psnr-epochs 1 --gan-epochs 500 [image-folder with train and val folders]
```

To train noisyESRGAN, we run 
```text
cd ESRGAN_Pytorch
python train.py -a esrgan16 --gpu 0 --pretrained --psnr-epochs 8 --gan-epochs 200 --add-noise 1 [image-folder with train and val folders]
```

We use pretrained weights for SRGAN, ESRGAN, and DIDN

### How to Test Benchmark
Experiment 1: Denoise and then Superresolution
```text
cd SRGAN
python test_benchmark.py -a srgan --pretrained --gpu 0 --noise_std 0.05 --pre-denoise didn [image-folder with train and val folders]
```

```text
cd ESRGAN
python test_benchmark.py -a esrgan16 --pretrained --gpu 0 --noise_std 0.05 --pre-denoise didn [image-folder with train and val folders]
```

Experiment 2: Superresolution and then Denoise
```text
cd SRGAN
python test_benchmark.py -a srgan --pretrained --gpu 0 --noise_std 0.05 --post-denoise didn [image-folder with train and val folders]
```

```text
cd ESRGAN
python test_benchmark.py -a esrgan16 --pretrained --gpu 0 --noise_std 0.05 --post-denoise didn [image-folder with train and val folders]
```

Experiment 3: One model noisySRGAN or noisyESRGAN
```text
cd SRGAN
python test_benchmark.py -a srgan --model-path [path to weights] --gpu 0 --noise_std 0.05 [image-folder with train and val folders]
```

```text
cd ESRGAN
python test_benchmark.py -a esrgan16 --model-path [path to weights] --gpu 0 --noise_std 0.05 [image-folder with train and val folders]
```


Experiment examples

![](/visual_results/img8.png)

![](/visual_results/img4.png)

