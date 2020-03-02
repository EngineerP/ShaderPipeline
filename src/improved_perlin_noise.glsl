// Given a 3d position as a seed, compute an even smoother procedural noise
// value. "Improving Noise" [Perlin 2002].
//
// Inputs:
//   st  3D seed
// Values between  -½ and ½ ?
//
// expects: random_direction, improved_smooth_step
float improved_perlin_noise( vec3 st) 
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  //Made following steps on: https://flafla2.github.io/2014/08/09/perlinnoise.html
  //Grid Step: Set up the Cube encasing st.
  vec3 v000 = floor(st);
  vec3 v111 = ceil(st);
  vec3 v010 = vec3(v000.x, v111.y, v000.z);
  vec3 v001 = vec3(v000.x, v000.y, v111.z);
  vec3 v011 = vec3(v000.x, v111.y, v111.z);
  vec3 v100 = vec3(v111.x, v000.y, v000.z);
  vec3 v110 = vec3(v111.x, v111.y, v000.z);
  vec3 v101 = vec3(v111.x, v000.y, v111.z);

  // Random Gradient Step
  vec3 g000 = random_direction(v000);
  vec3 g010 = random_direction(v010);
  vec3 g001 = random_direction(v001);
  vec3 g011 = random_direction(v011);
  vec3 g100 = random_direction(v100);
  vec3 g110 = random_direction(v110);
  vec3 g101 = random_direction(v101);
  vec3 g111 = random_direction(v111);

  // Distance Step
  vec3 d000 = st - v000;
  vec3 d010 = st - v010;
  vec3 d001 = st - v001;
  vec3 d011 = st - v011;
  vec3 d100 = st - v100;
  vec3 d110 = st - v110;
  vec3 d101 = st - v101;
  vec3 d111 = st - v111;

  // Dot Product Step
  float i000 = dot(d000, g000);
  float i010 = dot(d010, g010);
  float i001 = dot(d001, g001);
  float i011 = dot(d011, g011);
  float i100 = dot(d100, g100);
  float i110 = dot(d110, g110);
  float i101 = dot(d101, g101);
  float i111 = dot(d111, g111);

  //Interpolation Step
  vec3 stepSize = improved_smooth_step(fract(st));

  float i000to100 = mix(i000, i100, stepSize.x);
  float i010to110 = mix(i010, i110, stepSize.x);
  float i001to101 = mix(i001, i101, stepSize.x);
  float i011to111 = mix(i011, i111, stepSize.x);

  float ix00to10 = mix(i000to100, i010to110, stepSize.y);
  float ix01to11 = mix(i001to101, i011to111, stepSize.y);

  float finalInterpolation = mix(ix00to10, ix01to11, stepSize.z);

  //To provide [1,-1], multiply by 2 and subtract 1
  return finalInterpolation -0.5;
  /////////////////////////////////////////////////////////////////////////////
}

