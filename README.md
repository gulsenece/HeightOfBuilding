# Height of the Building Estimation with Kalman Filter in MATLAB
I got this example from this [link](https://www.kalmanfilter.net/kalman1d.html) and just changing the values of mesarument values of z and values of the measurement variance r.

Firstly, let's explain basically how is the Kalman Filter and how can be used it?

## How it Works?
The Kalman filter is a mathematical algorithm that is used to estimate the state of a dynamic system based on a series of noisy measurements.
The Kalman filter works by combining a prediction of the system's state with a measurement of the system's state, using a weighted average based on the relative uncertainty of each source of information. The filter uses a state model that describes how the system evolves over time, and a measurement model that describes how the measurements relate to the system state.

At each iteration of the algorithm, the filter makes a prediction of the system's state based on the previous state and the state model, and then adjusts this prediction based on the most recent measurement and the measurement model. The Kalman filter also maintains estimates of the uncertainty associated with the predicted state and the measurement, and uses these estimates to adjust the weighting of the prediction and the measurement in the final estimate of the system's state.

The Kalman filter is particularly useful when the measurements are noisy or incomplete, and when the system dynamics are subject to uncertainty or random disturbances. By combining information from multiple sources and accounting for the uncertainty in each source, the Kalman filter can provide a more accurate and reliable estimate of the system's state than would be possible using only the measurements or the state model alone.

### Our Problem is Height of Building Estimation

Let's explain the our problem and how can we solve this. We know that the height of building cannot change at least during the short measurement process. In our problem is given that;
The true building height is 50 meters. (x_true = 50m)
The altimeter measurement error (standard deviation) is 7 meters(σ = 49)
The ten measurements are: 47.84m, 48.31m, 52.56m, 54.17m, 49.37m, 42.56m, 46.73m, 52.62m, 50.85m, 49.76m. (z = [47.84, 48.31, 52.56, 54.17, 49.37, 42.56, 46.73, 52.62, 50.85, 49.76];% Simulate measurement)

#### ZEROTH ITERATION
##### Initialization
The estimated height of the building for the initialization purpose is x_hat = 60m

Now we shall initialize the estimate variance. Estimate variance is also stated estimate uncertanity. 
A human estimation error (standard deviation) is about 15 meters: σ=15. Consequently the variance is 225: σ2=225 so P(1) = 225

##### Prediction
Now, we shall predict the next state based on the initialization values.
<br />
Since our system's Dynamic Model is constant so, x_hat_minus = x_hat = 60m
<br />
The estimate variance also doesn't change so, P_minus(1) = P(1) = 225.

#### FIRST ITERATION

##### STEP 1; MEASURE
The first measurement z_1=49.03m
Since the standard deviation ( σ ) of the altimeter measurement error is 7, the variance ( σ2=49 ) would be 49, thus, the measurement variance is: r_1=49

##### STEP 2; PREDICT
Prediction of current state, x_hat_minus(t) = x_hat(t-1) 
<br />
Prediction of error uncertainity, P_minus(t) = P(t-1)

##### STEP 3; UPDATE
Calculation of Kalman Gain, K_1= (P_minus)/(P_minus+r_1) = 225/225+25 = 0.9
<br />
Update of current state, x_hat(t) = x_hat_minus(t) + K_1*(z_1 - x_hat_minus(t)) = 60 + 0.9*(48.54−60) = 49.69m
<br />
Update of error uncertainity, P(t) = (1 - K_1)*P_minus(1) = (1–0.9)*225 = 22.5

Iteration is continued until the 10th iteration.

If you run the code, you will get these figures. 

First figure is Building Height Estimation Using Kalman Filter for prediction the building of height. Another figure illustrates the Kalman Gain. 

The below figure is given for comparison of the true value, measurement values and estimation values vs. height

![EstimationFigure](https://user-images.githubusercontent.com/74204842/233624368-de6e7cc1-b35c-4833-93b6-5e25418333b2.png)

Kalman Gain is important parameter for the Kalman Filter.

The Kalman Gain is updated at each iteration of the Kalman filter, based on the most recent measurement and the current state estimate. It is used to adjust the predicted state estimate to better match the measurements, while also accounting for the inherent uncertainty and noise in both the measurements and the system dynamics. Kalman Gain gets closer to zero thus our system becomes more and more precise.

![KalmanGain](https://user-images.githubusercontent.com/74204842/233624391-9ae68e0b-08a8-4a53-8db8-dfc189671fd7.png)

[From this link](https://github.com/gulsenece/HeightOfBuilding/blob/main/HeightOfBuilding.m) you can reach my code that I wrote in MATLAB.
