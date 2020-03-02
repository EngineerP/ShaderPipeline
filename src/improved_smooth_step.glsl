// Filter an input value to perform an even smoother step. This function should
// be a quintic polynomial with improved_smooth_step(0) = 0,
// improved_smooth_step(1) = 1, and zero first _and_ second derivatives at f=0
// and f=1. "Improving Noise" [Perlin 2002].
//
// Inputs:
//   f  input value
// Returns filtered output value
float improved_smooth_step( float f)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  //f(x) = 6x^5 -15x^4 + 10x^3
  return 6.0*pow(f,5) - 15.0*pow(f, 4) + 10.0*pow(f,3);
  /////////////////////////////////////////////////////////////////////////////
}
vec3 improved_smooth_step( vec3 f)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  return vec3(6.0*pow(f.x,5) - 15.0*pow(f.x, 4) + 10.0*pow(f.x,3), 6.0*pow(f.y,5) - 15.0*pow(f.y, 4) + 10.0*pow(f.y,3), 6.0*pow(f.z,5) - 15.0*pow(f.z, 4) + 10.0*pow(f.z,3));
  /////////////////////////////////////////////////////////////////////////////
}
