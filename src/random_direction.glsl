// Generate a pseudorandom unit 3D vector
// 
// Inputs:
//   seed  3D seed
// Returns psuedorandom, unit 3D vector drawn from uniform distribution over
// the unit sphere (assuming random2 is uniform over [0,1]²).
//
// expects: random2.glsl, PI.glsl
vec3 random_direction( vec3 seed)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code
  // Calculated using the formulae described on: http://mathworld.wolfram.com/SpherePointPicking.html
  vec2 r1 = random2(seed);
//  vec2 r2 = random2(r1);
//  vec2 r3 = random2(r2);
  float theta = 2.0*M_PI*r1[0];
  float phi = acos((2.0 * r1[1]) - 1.0);

  float x = -1.0*(cos(theta) * cos(phi));
  float z = cos(theta) * sin(phi);
  float y = sin(theta);

  return normalize(vec3(x,y,z));
  /////////////////////////////////////////////////////////////////////////////
}
