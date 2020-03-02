// Add (hard code) an orbiting (point or directional) light to the scene. Light
// the scene using the Blinn-Phong Lighting Model.
//
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
// Inputs:
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
out vec3 color;
// expects: PI, blinn_phong
void main()
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code za
  float p = 1000.0;
  float theta = 0.25*animation_seconds*M_PI;
  
  vec3 n = normalize(normal_fs_in);
  vec3 v = -1.0 * normalize(view_pos_fs_in.xyz);
  vec3 l = vec3(sin(theta), 0.8, -cos(theta));

  vec3 ka = vec3(0.1, 0.1, 0.1);
  vec3 ks;
  vec3 kd;
  if(is_moon){
    p = 100.0;
    ks = vec3(0.7, 0.7, 0.7);
    kd = vec3(0.5, 0.5, 0.5);
  }
  else{
    ks = vec3(1,1,1);
    kd = vec3(0.15, 0.15, 0.65);
  }
  color = blinn_phong(ka, kd, ks, p, n, v, l);
  /////////////////////////////////////////////////////////////////////////////
}
