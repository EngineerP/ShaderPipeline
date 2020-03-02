// Input:
//   N  3D unit normal vector
// Outputs:
//   T  3D unit tangent vector
//   B  3D unit bitangent vector
void tangent(in vec3 N, out vec3 T, out vec3 B)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  vec3 unitN = normalize(N);
  vec3 t = unitN;
  if(abs(t.x) <= abs(t.y) && abs(t.x) <= abs(t.z)) t.x = 1.0;
  else if (abs(t.y) <= abs(t.x) && abs(t.y) <= abs(t.z)) t.y = 1.0;
  else if (abs(t.z) <= abs(t.x) && abs(t.z) <= abs(t.y)) t.z = 1.0;
  T = normalize(cross(t, unitN));
  B = normalize(cross(unitN, T));
  /////////////////////////////////////////////////////////////////////////////
}
