// Set the pixel color using Blinn-Phong shading (e.g., with constant blue and
// gray material color) with a bumpy texture.
// 
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
// Inputs:
//                     linearly interpolated from tessellation evaluation shader
//                     output
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
//               rgb color of this pixel
out vec3 color;
// expects: model, blinn_phong, bump_height, bump_position,
// improved_perlin_noise, tangent
void main()
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code
  //Bump the point
  vec3 bumpedP = bump_position(is_moon, sphere_fs_in);

  //Get the tangents to the normal
  vec3 T;
  vec3 B;
  tangent(normal_fs_in, T, B);

  //Calculate the perceived normal
  float e = 0.0001;
  vec3 bumpedN = normalize(cross((bump_position(is_moon,sphere_fs_in + e*T) - bumpedP)/e, (bump_position(is_moon,sphere_fs_in + e*B) - bumpedP)/e));

  color = vec3(1,1,1);
  float p = 1000;
  float theta = 0.25*animation_seconds*M_PI;
  
  vec3 v = -1.0 * normalize(bumpedP.xyz);
  vec3 l = vec3(sin(theta), 0.8, -cos(theta));

  vec3 ka = vec3(0.25, 0.25, 0.25);
  vec3 ks;
  vec3 kd;

  float noiseDiff = 0;
  float noiseSpec = 0;

  if(is_moon){
    ks = clamp(vec3(0.7, 0.7, 0.7) + noiseSpec, 0, 1);
    kd = clamp(vec3(0.5, 0.5, 0.5) + noiseDiff, 0, 1);
  }
  else{
    ks = clamp(vec3(1,1,1) + noiseSpec, 0, 1);
    kd = clamp(vec3(0.75, 0.15, 0.15) + noiseDiff, 0, 1);
  }

  color = blinn_phong(ka, kd, ks, p, bumpedN, v, l);
  /////////////////////////////////////////////////////////////////////////////
}
