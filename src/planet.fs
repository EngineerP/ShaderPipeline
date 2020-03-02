// Generate a procedural planet and orbiting moon. Use layers of (improved)
// Perlin noise to generate planetary features such as vegetation, gaseous
// clouds, mountains, valleys, ice caps, rivers, oceans. Don't forget about the
// moon. Use `animation_seconds` in your noise input to create (periodic)
// temporal effects.
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
// expects: model, blinn_phong, bump_height, bump_position,
// improved_perlin_noise, tangent
vec3 bump_position2(bool is_moon , vec3 s)
{
    if(!is_moon){
        float bump = bump_height(is_moon, s);
        float threshold = clamp(mix(-0.8, -0.35, animation_seconds/10), -0.8, -0.35);
        if(bump < threshold){
            float stepSize = -0.4;
            return s + stepSize*s;
        }
        else return s + 2.0*bump*s;
    }
    else
        return bump_position(is_moon, s);
}
void main()
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  //Bump the point
  vec3 bumpedP = bump_position2(is_moon, sphere_fs_in);

  //Get the tangents to the normal
  vec3 T;
  vec3 B;
  tangent(normal_fs_in, T, B);

  //Calculate the perceived normal
  float e = 0.0001;
  vec3 bumpedN = normalize(cross((bump_position2(is_moon,sphere_fs_in + e*T) - bumpedP)/e, (bump_position2(is_moon,sphere_fs_in + e*B) - bumpedP)/e));
  color = vec3(1,1,1);
  float p = (improved_perlin_noise(sphere_fs_in) + 1.0)*500.0;
  float theta = 0.25*animation_seconds*M_PI;
  
  vec3 v = -1.0 * normalize(bumpedP.xyz);
  vec3 l = vec3(sin(theta), 0.8, -cos(theta));

  vec3 ka = vec3(0.25, 0.25, 0.25);
  vec3 ks;
  vec3 kd;

  float noiseDiff = (improved_perlin_noise(sphere_fs_in * 3.5) + 0.65)/2.0;
  float noiseSpec = 9.11*improved_perlin_noise(25.12*sphere_fs_in);
  //float noise2 = 0.0;
  if(is_moon){
    ks = clamp(vec3(0.7, 0.7, 0.7) + noiseSpec, 0, 1);
    kd = clamp(vec3(0.5, 0.5, 0.5) + noiseDiff, 0, 1);
  }
  else{
    if(animation_seconds < 10.0){
      kd.y = mix(0.15, 0.75, animation_seconds/10.0);
      kd.x = mix(0.75, 0.25, animation_seconds/10.0);
      kd.z = 0.15;
    }
    else{
      kd = vec3(0,length(normalize(bumpedP)), 0);//vec3(0.25, 0.75, 0.15);
    }
    
    float bump = bump_height(is_moon, sphere_fs_in);
    float threshold = clamp(mix(-0.8, -0.35, animation_seconds/10), -0.8, -0.35);
    if(bump < threshold) {
        kd = vec3(0.15, 0.15, 0.75);
        ks = clamp(vec3(0.8,0.75,0.8) + sin(improved_perlin_noise(4.25*sphere_fs_in)), 0, 1);
    }
    else if(bump >= threshold && bump < threshold + 0.01) {
        kd = vec3(0.937, 0.8667, 0.435);
        ks = clamp(vec3(0.8,0.75,0.8) + sin(improved_perlin_noise(4.25*sphere_fs_in)), 0, 1);
    }
    else {
        kd = clamp(kd + noiseDiff, 0, 1);
        ks = clamp(vec3(0.5,0.65,0.5) + noiseSpec, 0, 1);
    }

  }

  color = blinn_phong(ka, kd, ks, p, bumpedN, v, l);
  /////////////////////////////////////////////////////////////////////////////
}
