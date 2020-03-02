// Filter an input value to perform a smooth step. This function should be a
// cubic polynomial with smooth_step(0) = 0, smooth_step(1) = 1, and zero first
// derivatives at f=0 and f=1. 
//
// Inputs:
//   f  input value
// Returns filtered output value
float smooth_step( float f)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  return -2.0*pow(f, 3) + 2.0*pow(f, 2);
  /////////////////////////////////////////////////////////////////////////////
}

vec3 smooth_step( vec3 f)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  return vec3(-2.0*pow(f[0], 3) + 3.0*pow(f[0], 2), -2.0*pow(f[1], 3) + 3.0*pow(f[1], 2), -2.0*pow(f[2], 3) + 3.0*pow(f[2], 2));
  /////////////////////////////////////////////////////////////////////////////
}
