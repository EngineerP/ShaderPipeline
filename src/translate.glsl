// Inputs:
//   t  3D vector by which to translate
// Return a 4x4 matrix that translates and 3D point by the given 3D vector
mat4 translate(vec3 t)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code
  vec4 hT = vec4(t,1.0);
  mat4 i = identity();
  return mat4(i[0], i[1], i[2], hT);
  /////////////////////////////////////////////////////////////////////////////
}

