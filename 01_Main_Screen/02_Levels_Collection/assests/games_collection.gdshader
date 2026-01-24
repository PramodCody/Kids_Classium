shader_type canvas_item;

uniform vec2 shadow_offset = vec2(4.0, 4.0); // X, Y offset in pixels
uniform vec4 shadow_color : source_color = vec4(0.0, 0.0, 0.0, 0.6); // Shadow color with alpha
uniform float shadow_size = 6.0; // Shadow blur/size in pixels

void fragment() {
    vec2 texture_pixel_size = TEXTURE_PIXEL_SIZE;
    
    // Get the original texture color at current UV
    vec4 original = texture(TEXTURE, UV);
    
    // Calculate shadow by sampling around the CURRENT position (not offset)
    float shadow_alpha = 0.0;
    int samples = int(ceil(shadow_size));
    float total_weight = 0.0;
    
    // Sample in a circle pattern to create blur
    for(int x = -samples; x <= samples; x++) {
        for(int y = -samples; y <= samples; y++) {
            vec2 offset = vec2(float(x), float(y));
            float dist = length(offset);
            
            // Only sample within shadow_size radius
            if(dist <= shadow_size) {
                // Sample from OFFSET position (this is the key fix!)
                // We're at UV, but sampling from where the shadow should be cast FROM
                vec2 sample_uv = UV - (shadow_offset * texture_pixel_size) + (offset * texture_pixel_size);
                
                // Sample the alpha channel
                float sample_alpha = texture(TEXTURE, sample_uv).a;
                
                // Gaussian-like weight based on distance
                float weight = exp(-(dist * dist) / (shadow_size * shadow_size * 0.5));
                shadow_alpha += sample_alpha * weight;
                total_weight += weight;
            }
        }
    }
    
    // Normalize shadow alpha
    if(total_weight > 0.0) {
        shadow_alpha /= total_weight;
    }
    
    // Create the shadow color with calculated alpha
    vec4 shadow = shadow_color;
    shadow.a *= shadow_alpha * (1.0 - original.a); // Don't show shadow where original is opaque
    
    // Blend: shadow behind original
    COLOR.rgb = mix(shadow.rgb, original.rgb, original.a);
    COLOR.a = max(shadow.a, original.a);
}