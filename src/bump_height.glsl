// Create a bumpy surface by using procedural noise to generate a height (
// displacement in normal direction).
//
// Inputs:
//   is_moon  whether we're looking at the moon or centre planet
//   s  3D position of seed for noise generation
// Returns elevation adjust along normal (values between -0.1 and 0.1 are
//   reasonable.
float bump_height( bool is_moon, vec3 s)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  if(is_moon){
	return improved_perlin_noise(s*6.24)/9.0;
  }
  else{
	return improved_perlin_noise(s*3.5)/2.0 + improved_perlin_noise(s*7.5)/5.0;
  }
  /////////////////////////////////////////////////////////////////////////////
}
