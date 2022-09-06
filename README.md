# Giannakis-Formula
This is an assignment of the course Advanced Signal Processing (AUTh-7th semester-2020)

## Assignment's instructions - first part ##
At the first part of the assignment (*questions 1-6*) the aim is to construct a MA-q system (for q=5) with known input and output, in order to check the validity of Giannakis' formula.

In order to do so, the following steps were conducted:
 
* Initially, a real discrete signal x[k] is constructed, with k=1,2, ...,N=2048, which is derived as the output of a MA-q process with coefficients of [1, 0.93, 0.85, 0.72, 0.59, -0.1], driven by non-Gaussian noise v[k], which is derived from an exponential distribution with mean value of 1 (file X.m).
* The non-Gaussian character of input v[k] is justified by calculating its skewness (question 1 - file skew.m).
* The 3-rd order cumulants of x[k] are estimated and plotted using the indirect method, with K=32, M=64 and L3=20 (question 2 - file cum3.m)
* The 3-rd order cumulants were used to estimate the impulse response of the MA system, using the Giannakis' formula, yet considering sub-estimation of the order q (qsub = q-2), sup-estimation of the order q (q_sup = q+3) (questions 3,4 - file h_est.m)
* Finally, the MA-q system output output is estimated for each impulse response (file x_est.m), along with the Normal Root Mean Square Error (questions 5,6 - file NRMSE_fun.m)

The demonstration of the process takes place in the demo_x.m file

### Results ###

In the following 3 images, the original signal x[k] is depicted, along with the estimated, the sub-estimated and the sup-estimated respectively.

X estimated           |  X sub_estimated          |  X sup_estimated
:-------------------------:|:-------------------------:|:-------------------------:
![image](https://user-images.githubusercontent.com/26661405/188715316-805e1806-0d0c-4451-ae36-87fdf3e9484c.png) |![image](https://user-images.githubusercontent.com/26661405/188715347-0ab5b8ce-2e38-414d-ac3b-eced9671dbe3.png) | ![image](https://user-images.githubusercontent.com/26661405/188715367-cc8eb3bf-a079-482a-9c8d-279f0869e59b.png)


The NRMSE for each case can be seen in the following table: 
h_est  | h_sub  | h_sup 
-----  | -----  | ----- 
0.1531 | 0.1709 | 0.2609

## Assignment's instructions - second part ##

At the second part of the assignment a source of white Gaussian noise is added at the output of the system, producing a variation in the SNR of [30:-5:-5]dB. Then, the same process is followed as the first part, but instead of x[k], the noise contaminated output is used, for each level of SNR (question 7 - demo_y.m file).

### Results ###
In the following pictures the original signal y[k] is depicted along with the estimated y_est[k] for SNR [30:-5:15]dB and [10:-5:-5]dB respectively.

SNR [30:-5:15]dB                          | SNR [10:-5:-5]dB        
:-------------------------:|:-------------------------:
![image](https://user-images.githubusercontent.com/26661405/188721403-736b1be7-7eb5-426c-8428-f47e9230081a.png) | ![image](https://user-images.githubusercontent.com/26661405/188721685-2d925970-be3e-4cd1-8f0c-7d57f2f43466.png)

The signal estimation seems to improve for higher SNR levels.

 ## Assignment's instructions - third part ##
 
At the last part, instead of using one realization of the input and output data of the MA-q system, the whole process is repeated 50 times using the mean values. Thus, more valid conclusions can be drawn regarding Giannakis' formula reliability (question 8 - meanValues.m file).

### Results ### 

The following image depicts the boxplots of the mean NRMSE for the real order q, the sub-estimation of the order q-2 and the sup-estimation of the order q+3. Obviously, by sub-estimating the order, the width of the boxplot is much narrower and close to 0, compared to the rest plots.
 
![image](https://user-images.githubusercontent.com/26661405/188726803-22dede37-b552-49ff-9a48-1e32c9ee4d1c.png)

## Conclusion ##
Summarizing, Giannakis' formula can be applied in practice, making it possible to
calculate the impulse response of a system with only the information of
3rd order cumulants, either there is white additive Gaussian noise, or
no, taking into account that the formula is prone to class estimation.

