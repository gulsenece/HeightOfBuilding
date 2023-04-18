# HeightOfBuilding
In this example I got the datas and example values from https://www.kalmanfilter.net/kalman1d.html 

Height of building estimation with Kalman Filter in Matlab

If you run the code, you will get these figures. 

First figure is Building Height Estimation. Using Kalman Filter for prediction the building of height. 

![EstimationFigure](https://user-images.githubusercontent.com/74204842/232813725-58a03f18-a306-4b04-b51c-bd0eebd7e698.png)







Second figure is Kalman Gain. The Kalman Gain is important parameter for Kalman Filter. 

The Kalman Gain is updated at each iteration of the Kalman filter, based on the most recent measurement and the current state estimate. It is used to adjust the predicted state estimate to better match the measurements, while also accounting for the inherent uncertainty and noise in both the measurements and the system dynamics. Kalman Gain gets closer to zero thus our system becomes more and more precise.

![KalmanGain](https://user-images.githubusercontent.com/74204842/232813747-b974d9a6-1a33-4127-a537-937c179fd89a.png)




# Kalman Filter

The Kalman filter is a mathematical algorithm that is used to estimate the state of a dynamic system based on a series of noisy measurements. 

The Kalman filter works by combining a prediction of the system's state with a measurement of the system's state, using a weighted average based on the relative uncertainty of each source of information. The filter uses a state model that describes how the system evolves over time, and a measurement model that describes how the measurements relate to the system state.

At each iteration of the algorithm, the filter makes a prediction of the system's state based on the previous state and the state model, and then adjusts this prediction based on the most recent measurement and the measurement model. The Kalman filter also maintains estimates of the uncertainty associated with the predicted state and the measurement, and uses these estimates to adjust the weighting of the prediction and the measurement in the final estimate of the system's state.

The Kalman filter is particularly useful when the measurements are noisy or incomplete, and when the system dynamics are subject to uncertainty or random disturbances. By combining information from multiple sources and accounting for the uncertainty in each source, the Kalman filter can provide a more accurate and reliable estimate of the system's state than would be possible using only the measurements or the state model alone.
