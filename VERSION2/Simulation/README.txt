For now we will use ROS and rvis or Gazebo to build a simulation for the robot arm to test the controls program.

Install ROS Kinetic: http://wiki.ros.org/kinetic/Installation

Clone the urdf_tutorial folder to your ROS workspace. If you followed the ROS tutorial, you should be putting the cloned folder at ~/catkin_ws/src/urdf_tutorial

After you cloned the package, go to the root of your catkin_ws and called catkin_make to make your package.

Inside the urdf_tutorial, there's the folder exo-urdf, which is the folder I created. Inside contains the URDF file for the exo arm. 

Call to display the rvis for the arm by calling:
roslaunch urdf_tutorial display.launch model:=02-exo_arm_xacro.urdf.xacro

This should be called while inside the exo-urdf folder. If you are somewhere else, just change the absolute path.
