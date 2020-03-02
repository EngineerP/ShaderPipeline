// Inputs:
//   theta  amount y which to rotate (in radians)
// Return a 4x4 matrix that rotates a given 3D point/vector about the y-axis by
// the given amount.
mat4 rotate_about_y(float theta)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code
  mat4 hmR = identity();
  hmR[0][0] = cos(theta);
  hmR[2][0] = sin(theta);
  hmR[0][2] = -sin(theta);
  hmR[2][2] = cos(theta);
  return hmR;
  /////////////////////////////////////////////////////////////////////////////
}

