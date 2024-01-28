// NormalMap32 evolved from the original NormalMapExtended 1.4 https://www.construct.net/make-games/addons/194/normalmapextended by Mikal
//
// V1.0 - by donelwero
//	Ported the original effect from Matt DesLauriers to Construct 2 https://www.construct.net/en/forum/construct-2/effects-31/effect-2d-dynamic-lighting-52734
//	Original effect: https://github.com/mattdesl/lwjgl-basics/wiki/ShaderLesson6
//
// V1.01 - by matriax
//	Added support to pass light variables directly from C2. https://www.construct.net/forum/construct-2/effects-31/effect-normal-map-extended-1-99975
//	Added support for up to 3 simultaneous light sources per normal map.
//	Allowing to set how desired light points are applied and to use normal maps with alpha channels.
//
// V1.3 - by Mikal
//	Ported to Construct 3 https://www.construct.net/forum/construct-3/plugin-sdk-10/c3effects-normalmapextended-130405
//	Code cleanup and removed redundant calculations.
//	Changed background sampler to use relative locations not vTex
//		mediump vec2 n = (vTex - srcStart) / (srcEnd - srcStart);
//		lowp vec4 DiffuseColor = texture2D(u_texture, mix(destStart, destEnd, n));
//
// V1.4 - by Mikal
//	Updated with Spotlight effect.
//	Add three new parameters to the end of the effect list with default values.
//	Light * Distance Limit range of 0-2, beyond this distance the normal map main light is greatly diminished (ambient not effected.)
//
// V1.5 - by Everade
//	Increased support for up to 32 simultaneous light sources.
//
// V1.6 - by Everade
//	Adjusted falloff formula for better light control. Removes the spotlight effect.
//	Updated and improved addon and parameter descriptions.
//
// V1.7 - by Everade
//	Added WebGL2 variant (GLSL 300 es)
//	Code optimizations
//
// Note: if possible don't use 'precision highp float'! This will unnecessarily reduce performance
// on mobile devices. Instead always try to specify an appropriate precision level. As a guide, use:
// lowp - for color and alpha values returned by samplers
// mediump - for texture co-ordinates
// highp - only where increased precision is necessary
//
// The current texture co-ordinates (required).  Note these are normalised to [0, 1] float range, so
// (1, 1) is always the bottom right corner and (0.5, 0.5) is always the middle.
//
// The sampler to retrieve pixels from the foreground texture (required)
//
// Optional: for sampling the background.  Uncomment all three if background
// sampling is required, and set 'blends-background' to 'true' in the XML file.
//
// Optional parameters. Uncomment any lines and they will automatically
// receive the correct values from runtime. Be sure not to accidentally
// uncomment any parameters you do not really need - doing so can reduce performance.
// uniform mediump float pixelWidth;		// width of a pixel in texture co-ordinates
// uniform mediump float pixelHeight;		// height of a pixel in texture co-ordinates
// uniform mediump float layerScale;		// scale of the current layer
// uniform mediump float seconds;			// number of seconds elapsed since start of game
//
// Add any custom parameters below as uniform floats, e.g.
// uniform mediump float exampleParam;
// where 'exampleParam' is specified as the 'uniform' for a parameter in the XML file.

precision highp float;

// Retrieve plugin parameters
// Resolution
uniform float screenXResolution;
uniform float screenYResolution;
// Light 1
uniform float light1State;
uniform float light1PosX;
uniform float light1PosY;
uniform float light1PosZ;
uniform float light1ColorR;
uniform float light1ColorG;
uniform float light1ColorB;
uniform float light1Luminosity;
uniform float light1AmbientR;
uniform float light1AmbientG;
uniform float light1AmbientB;
uniform float light1AmbientLuminosity;
uniform float light1Distance;
uniform float light1Falloffv1;
uniform float light1Falloffv2;
uniform float light1Falloffv3;
// Light 2
uniform float light2State;
uniform float light2PosX;
uniform float light2PosY;
uniform float light2PosZ;
uniform float light2ColorR;
uniform float light2ColorG;
uniform float light2ColorB;
uniform float light2Luminosity;
uniform float light2AmbientR;
uniform float light2AmbientG;
uniform float light2AmbientB;
uniform float light2AmbientLuminosity;
uniform float light2Distance;
uniform float light2Falloffv1;
uniform float light2Falloffv2;
uniform float light2Falloffv3;
// Light 3
uniform float light3State;
uniform float light3PosX;
uniform float light3PosY;
uniform float light3PosZ;
uniform float light3ColorR;
uniform float light3ColorG;
uniform float light3ColorB;
uniform float light3Luminosity;
uniform float light3AmbientR;
uniform float light3AmbientG;
uniform float light3AmbientB;
uniform float light3AmbientLuminosity;
uniform float light3Distance;
uniform float light3Falloffv1;
uniform float light3Falloffv2;
uniform float light3Falloffv3;
// Light 4
uniform float light4State;
uniform float light4PosX;
uniform float light4PosY;
uniform float light4PosZ;
uniform float light4ColorR;
uniform float light4ColorG;
uniform float light4ColorB;
uniform float light4Luminosity;
uniform float light4AmbientR;
uniform float light4AmbientG;
uniform float light4AmbientB;
uniform float light4AmbientLuminosity;
uniform float light4Distance;
uniform float light4Falloffv1;
uniform float light4Falloffv2;
uniform float light4Falloffv3;
// Light 5
uniform float light5State;
uniform float light5PosX;
uniform float light5PosY;
uniform float light5PosZ;
uniform float light5ColorR;
uniform float light5ColorG;
uniform float light5ColorB;
uniform float light5Luminosity;
uniform float light5AmbientR;
uniform float light5AmbientG;
uniform float light5AmbientB;
uniform float light5AmbientLuminosity;
uniform float light5Distance;
uniform float light5Falloffv1;
uniform float light5Falloffv2;
uniform float light5Falloffv3;
// Light 6
uniform float light6State;
uniform float light6PosX;
uniform float light6PosY;
uniform float light6PosZ;
uniform float light6ColorR;
uniform float light6ColorG;
uniform float light6ColorB;
uniform float light6Luminosity;
uniform float light6AmbientR;
uniform float light6AmbientG;
uniform float light6AmbientB;
uniform float light6AmbientLuminosity;
uniform float light6Distance;
uniform float light6Falloffv1;
uniform float light6Falloffv2;
uniform float light6Falloffv3;
// Light 7
uniform float light7State;
uniform float light7PosX;
uniform float light7PosY;
uniform float light7PosZ;
uniform float light7ColorR;
uniform float light7ColorG;
uniform float light7ColorB;
uniform float light7Luminosity;
uniform float light7AmbientR;
uniform float light7AmbientG;
uniform float light7AmbientB;
uniform float light7AmbientLuminosity;
uniform float light7Distance;
uniform float light7Falloffv1;
uniform float light7Falloffv2;
uniform float light7Falloffv3;
// Light 8
uniform float light8State;
uniform float light8PosX;
uniform float light8PosY;
uniform float light8PosZ;
uniform float light8ColorR;
uniform float light8ColorG;
uniform float light8ColorB;
uniform float light8Luminosity;
uniform float light8AmbientR;
uniform float light8AmbientG;
uniform float light8AmbientB;
uniform float light8AmbientLuminosity;
uniform float light8Distance;
uniform float light8Falloffv1;
uniform float light8Falloffv2;
uniform float light8Falloffv3;
// Light 9
uniform float light9State;
uniform float light9PosX;
uniform float light9PosY;
uniform float light9PosZ;
uniform float light9ColorR;
uniform float light9ColorG;
uniform float light9ColorB;
uniform float light9Luminosity;
uniform float light9AmbientR;
uniform float light9AmbientG;
uniform float light9AmbientB;
uniform float light9AmbientLuminosity;
uniform float light9Distance;
uniform float light9Falloffv1;
uniform float light9Falloffv2;
uniform float light9Falloffv3;
// Light 10
uniform float light10State;
uniform float light10PosX;
uniform float light10PosY;
uniform float light10PosZ;
uniform float light10ColorR;
uniform float light10ColorG;
uniform float light10ColorB;
uniform float light10Luminosity;
uniform float light10AmbientR;
uniform float light10AmbientG;
uniform float light10AmbientB;
uniform float light10AmbientLuminosity;
uniform float light10Distance;
uniform float light10Falloffv1;
uniform float light10Falloffv2;
uniform float light10Falloffv3;
// Light 11
uniform float light11State;
uniform float light11PosX;
uniform float light11PosY;
uniform float light11PosZ;
uniform float light11ColorR;
uniform float light11ColorG;
uniform float light11ColorB;
uniform float light11Luminosity;
uniform float light11AmbientR;
uniform float light11AmbientG;
uniform float light11AmbientB;
uniform float light11AmbientLuminosity;
uniform float light11Distance;
uniform float light11Falloffv1;
uniform float light11Falloffv2;
uniform float light11Falloffv3;
// Light 12
uniform float light12State;
uniform float light12PosX;
uniform float light12PosY;
uniform float light12PosZ;
uniform float light12ColorR;
uniform float light12ColorG;
uniform float light12ColorB;
uniform float light12Luminosity;
uniform float light12AmbientR;
uniform float light12AmbientG;
uniform float light12AmbientB;
uniform float light12AmbientLuminosity;
uniform float light12Distance;
uniform float light12Falloffv1;
uniform float light12Falloffv2;
uniform float light12Falloffv3;
// Light 13
uniform float light13State;
uniform float light13PosX;
uniform float light13PosY;
uniform float light13PosZ;
uniform float light13ColorR;
uniform float light13ColorG;
uniform float light13ColorB;
uniform float light13Luminosity;
uniform float light13AmbientR;
uniform float light13AmbientG;
uniform float light13AmbientB;
uniform float light13AmbientLuminosity;
uniform float light13Distance;
uniform float light13Falloffv1;
uniform float light13Falloffv2;
uniform float light13Falloffv3;
// Light 14
uniform float light14State;
uniform float light14PosX;
uniform float light14PosY;
uniform float light14PosZ;
uniform float light14ColorR;
uniform float light14ColorG;
uniform float light14ColorB;
uniform float light14Luminosity;
uniform float light14AmbientR;
uniform float light14AmbientG;
uniform float light14AmbientB;
uniform float light14AmbientLuminosity;
uniform float light14Distance;
uniform float light14Falloffv1;
uniform float light14Falloffv2;
uniform float light14Falloffv3;
// Light 15
uniform float light15State;
uniform float light15PosX;
uniform float light15PosY;
uniform float light15PosZ;
uniform float light15ColorR;
uniform float light15ColorG;
uniform float light15ColorB;
uniform float light15Luminosity;
uniform float light15AmbientR;
uniform float light15AmbientG;
uniform float light15AmbientB;
uniform float light15AmbientLuminosity;
uniform float light15Distance;
uniform float light15Falloffv1;
uniform float light15Falloffv2;
uniform float light15Falloffv3;
// Light 16
uniform float light16State;
uniform float light16PosX;
uniform float light16PosY;
uniform float light16PosZ;
uniform float light16ColorR;
uniform float light16ColorG;
uniform float light16ColorB;
uniform float light16Luminosity;
uniform float light16AmbientR;
uniform float light16AmbientG;
uniform float light16AmbientB;
uniform float light16AmbientLuminosity;
uniform float light16Distance;
uniform float light16Falloffv1;
uniform float light16Falloffv2;
uniform float light16Falloffv3;
// Light 17
uniform float light17State;
uniform float light17PosX;
uniform float light17PosY;
uniform float light17PosZ;
uniform float light17ColorR;
uniform float light17ColorG;
uniform float light17ColorB;
uniform float light17Luminosity;
uniform float light17AmbientR;
uniform float light17AmbientG;
uniform float light17AmbientB;
uniform float light17AmbientLuminosity;
uniform float light17Distance;
uniform float light17Falloffv1;
uniform float light17Falloffv2;
uniform float light17Falloffv3;
// Light 18
uniform float light18State;
uniform float light18PosX;
uniform float light18PosY;
uniform float light18PosZ;
uniform float light18ColorR;
uniform float light18ColorG;
uniform float light18ColorB;
uniform float light18Luminosity;
uniform float light18AmbientR;
uniform float light18AmbientG;
uniform float light18AmbientB;
uniform float light18AmbientLuminosity;
uniform float light18Distance;
uniform float light18Falloffv1;
uniform float light18Falloffv2;
uniform float light18Falloffv3;
// Light 19
uniform float light19State;
uniform float light19PosX;
uniform float light19PosY;
uniform float light19PosZ;
uniform float light19ColorR;
uniform float light19ColorG;
uniform float light19ColorB;
uniform float light19Luminosity;
uniform float light19AmbientR;
uniform float light19AmbientG;
uniform float light19AmbientB;
uniform float light19AmbientLuminosity;
uniform float light19Distance;
uniform float light19Falloffv1;
uniform float light19Falloffv2;
uniform float light19Falloffv3;
// Light 20
uniform float light20State;
uniform float light20PosX;
uniform float light20PosY;
uniform float light20PosZ;
uniform float light20ColorR;
uniform float light20ColorG;
uniform float light20ColorB;
uniform float light20Luminosity;
uniform float light20AmbientR;
uniform float light20AmbientG;
uniform float light20AmbientB;
uniform float light20AmbientLuminosity;
uniform float light20Distance;
uniform float light20Falloffv1;
uniform float light20Falloffv2;
uniform float light20Falloffv3;
// Light 21
uniform float light21State;
uniform float light21PosX;
uniform float light21PosY;
uniform float light21PosZ;
uniform float light21ColorR;
uniform float light21ColorG;
uniform float light21ColorB;
uniform float light21Luminosity;
uniform float light21AmbientR;
uniform float light21AmbientG;
uniform float light21AmbientB;
uniform float light21AmbientLuminosity;
uniform float light21Distance;
uniform float light21Falloffv1;
uniform float light21Falloffv2;
uniform float light21Falloffv3;
// Light 22
uniform float light22State;
uniform float light22PosX;
uniform float light22PosY;
uniform float light22PosZ;
uniform float light22ColorR;
uniform float light22ColorG;
uniform float light22ColorB;
uniform float light22Luminosity;
uniform float light22AmbientR;
uniform float light22AmbientG;
uniform float light22AmbientB;
uniform float light22AmbientLuminosity;
uniform float light22Distance;
uniform float light22Falloffv1;
uniform float light22Falloffv2;
uniform float light22Falloffv3;
// Light 23
uniform float light23State;
uniform float light23PosX;
uniform float light23PosY;
uniform float light23PosZ;
uniform float light23ColorR;
uniform float light23ColorG;
uniform float light23ColorB;
uniform float light23Luminosity;
uniform float light23AmbientR;
uniform float light23AmbientG;
uniform float light23AmbientB;
uniform float light23AmbientLuminosity;
uniform float light23Distance;
uniform float light23Falloffv1;
uniform float light23Falloffv2;
uniform float light23Falloffv3;
// Light 24
uniform float light24State;
uniform float light24PosX;
uniform float light24PosY;
uniform float light24PosZ;
uniform float light24ColorR;
uniform float light24ColorG;
uniform float light24ColorB;
uniform float light24Luminosity;
uniform float light24AmbientR;
uniform float light24AmbientG;
uniform float light24AmbientB;
uniform float light24AmbientLuminosity;
uniform float light24Distance;
uniform float light24Falloffv1;
uniform float light24Falloffv2;
uniform float light24Falloffv3;
// Light 25
uniform float light25State;
uniform float light25PosX;
uniform float light25PosY;
uniform float light25PosZ;
uniform float light25ColorR;
uniform float light25ColorG;
uniform float light25ColorB;
uniform float light25Luminosity;
uniform float light25AmbientR;
uniform float light25AmbientG;
uniform float light25AmbientB;
uniform float light25AmbientLuminosity;
uniform float light25Distance;
uniform float light25Falloffv1;
uniform float light25Falloffv2;
uniform float light25Falloffv3;
// Light 26
uniform float light26State;
uniform float light26PosX;
uniform float light26PosY;
uniform float light26PosZ;
uniform float light26ColorR;
uniform float light26ColorG;
uniform float light26ColorB;
uniform float light26Luminosity;
uniform float light26AmbientR;
uniform float light26AmbientG;
uniform float light26AmbientB;
uniform float light26AmbientLuminosity;
uniform float light26Distance;
uniform float light26Falloffv1;
uniform float light26Falloffv2;
uniform float light26Falloffv3;
// Light 27
uniform float light27State;
uniform float light27PosX;
uniform float light27PosY;
uniform float light27PosZ;
uniform float light27ColorR;
uniform float light27ColorG;
uniform float light27ColorB;
uniform float light27Luminosity;
uniform float light27AmbientR;
uniform float light27AmbientG;
uniform float light27AmbientB;
uniform float light27AmbientLuminosity;
uniform float light27Distance;
uniform float light27Falloffv1;
uniform float light27Falloffv2;
uniform float light27Falloffv3;
// Light 28
uniform float light28State;
uniform float light28PosX;
uniform float light28PosY;
uniform float light28PosZ;
uniform float light28ColorR;
uniform float light28ColorG;
uniform float light28ColorB;
uniform float light28Luminosity;
uniform float light28AmbientR;
uniform float light28AmbientG;
uniform float light28AmbientB;
uniform float light28AmbientLuminosity;
uniform float light28Distance;
uniform float light28Falloffv1;
uniform float light28Falloffv2;
uniform float light28Falloffv3;
// Light 29
uniform float light29State;
uniform float light29PosX;
uniform float light29PosY;
uniform float light29PosZ;
uniform float light29ColorR;
uniform float light29ColorG;
uniform float light29ColorB;
uniform float light29Luminosity;
uniform float light29AmbientR;
uniform float light29AmbientG;
uniform float light29AmbientB;
uniform float light29AmbientLuminosity;
uniform float light29Distance;
uniform float light29Falloffv1;
uniform float light29Falloffv2;
uniform float light29Falloffv3;
// Light 30
uniform float light30State;
uniform float light30PosX;
uniform float light30PosY;
uniform float light30PosZ;
uniform float light30ColorR;
uniform float light30ColorG;
uniform float light30ColorB;
uniform float light30Luminosity;
uniform float light30AmbientR;
uniform float light30AmbientG;
uniform float light30AmbientB;
uniform float light30AmbientLuminosity;
uniform float light30Distance;
uniform float light30Falloffv1;
uniform float light30Falloffv2;
uniform float light30Falloffv3;
// Light 31
uniform float light31State;
uniform float light31PosX;
uniform float light31PosY;
uniform float light31PosZ;
uniform float light31ColorR;
uniform float light31ColorG;
uniform float light31ColorB;
uniform float light31Luminosity;
uniform float light31AmbientR;
uniform float light31AmbientG;
uniform float light31AmbientB;
uniform float light31AmbientLuminosity;
uniform float light31Distance;
uniform float light31Falloffv1;
uniform float light31Falloffv2;
uniform float light31Falloffv3;
// Light 32
uniform float light32State;
uniform float light32PosX;
uniform float light32PosY;
uniform float light32PosZ;
uniform float light32ColorR;
uniform float light32ColorG;
uniform float light32ColorB;
uniform float light32Luminosity;
uniform float light32AmbientR;
uniform float light32AmbientG;
uniform float light32AmbientB;
uniform float light32AmbientLuminosity;
uniform float light32Distance;
uniform float light32Falloffv1;
uniform float light32Falloffv2;
uniform float light32Falloffv3;

// Attribute from vertex shader
varying mediump vec2 vTex;

// Texture samplers
uniform lowp sampler2D samplerBack;		//diffuse map
uniform lowp sampler2D samplerFront;	//normal map

// Texture rectangle
uniform mediump vec2 destStart;
uniform mediump vec2 destEnd;
uniform mediump vec2 srcEnd;
uniform mediump vec2 srcStart;

// Light position, normalized
vec3 LightPos;

// Resolution
vec2 Resolution;

void main(void)
{
	// RGBA of our normal map color
	lowp vec4 front = texture2D(samplerFront, vTex);

	// RGBA of our diffuse color, use relative location
	mediump vec2 n = (vTex - srcStart) / (srcEnd - srcStart);
	lowp vec4 DiffuseColor = texture2D(samplerBack, mix(destStart, destEnd, n));

	// RGB of our normal map
	mediump vec3 NormalMap = texture2D(samplerFront, vTex).rgb;

	// Sum of multiple lights
	vec3 Sum = vec3(0.0);

	// Retrieve screen resolution
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;

	// Vertex shader attribute
	vec4 vColor = vec4(1.0,1.0,1.0,1.0);

// ===============
// LIGHT 1
// ===============
	// Light RGBA - alpha is intensity
	vec4 LightColor = vec4(light1ColorR,light1ColorG,light1ColorB,light1Luminosity);
	// Ambient RGBA - alpha is intensity 
	vec4 AmbientColor = vec4(light1AmbientR,light1AmbientG,light1AmbientB,light1AmbientLuminosity);
	// Attenuation coefficients
	vec3 Falloff = vec3(light1Falloffv1,light1Falloffv2,light1Falloffv3);

	// Retrieve position of light
	LightPos.x = light1PosX;
	LightPos.y = light1PosY;
	LightPos.y = 1.0 - LightPos.y;
	LightPos.z = light1PosZ;

	// Delta position of light
	vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

	// Correct for aspect ratio
	LightDir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(LightDir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light1Distance) ? D : 1000.0;

	// Normalize our vectors
	vec3 N = normalize(NormalMap * 2.0 - 1.0);
	vec3 L = normalize(LightDir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);

	// Pre-multiply ambient color with intensity
	vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

	// Calculate attenuation
	float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

	// Bring it all together
	vec3 Intensity = Ambient + Diffuse * Attenuation;
	vec3 FinalColor = DiffuseColor.rgb * Intensity;
	gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

	// Sum up for multiple lights
	Sum += FinalColor * light1State;

// ===============
// LIGHT 2
// ===============
	if (light2State != 0.0){
		vec4 LightColor = vec4(light2ColorR,light2ColorG,light2ColorB,light2Luminosity);
		vec4 AmbientColor = vec4(light2AmbientR,light2AmbientG,light2AmbientB,light2AmbientLuminosity);
		vec3 Falloff = vec3(light2Falloffv1,light2Falloffv2,light2Falloffv3);

		LightPos.x = light2PosX;
		LightPos.y = light2PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light2PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light2Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light2State;
	}

// ===============
// LIGHT 3
// ===============
	if (light3State != 0.0){
		vec4 LightColor = vec4(light3ColorR,light3ColorG,light3ColorB,light3Luminosity);
		vec4 AmbientColor = vec4(light3AmbientR,light3AmbientG,light3AmbientB,light3AmbientLuminosity);
		vec3 Falloff = vec3(light3Falloffv1,light3Falloffv2,light3Falloffv3);

		LightPos.x = light3PosX;
		LightPos.y = light3PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light3PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light3Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light3State;
	}

// ===============
// LIGHT 4
// ===============
	if (light4State != 0.0){
		vec4 LightColor = vec4(light4ColorR,light4ColorG,light4ColorB,light4Luminosity);
		vec4 AmbientColor = vec4(light4AmbientR,light4AmbientG,light4AmbientB,light4AmbientLuminosity);
		vec3 Falloff = vec3(light4Falloffv1,light4Falloffv2,light4Falloffv3);
		
		LightPos.x = light4PosX;
		LightPos.y = light4PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light4PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light4Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light4State;
	}

// ===============
// LIGHT 5
// ===============
	if (light5State != 0.0){
		vec4 LightColor = vec4(light5ColorR,light5ColorG,light5ColorB,light5Luminosity);
		vec4 AmbientColor = vec4(light5AmbientR,light5AmbientG,light5AmbientB,light5AmbientLuminosity);
		vec3 Falloff = vec3(light5Falloffv1,light5Falloffv2,light5Falloffv3);

		LightPos.x = light5PosX;
		LightPos.y = light5PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light5PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light5Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light5State;
	}

// ===============
// LIGHT 6
// ===============
	if (light6State != 0.0){
		vec4 LightColor = vec4(light6ColorR,light6ColorG,light6ColorB,light6Luminosity);
		vec4 AmbientColor = vec4(light6AmbientR,light6AmbientG,light6AmbientB,light6AmbientLuminosity);
		vec3 Falloff = vec3(light6Falloffv1,light6Falloffv2,light6Falloffv3);

		LightPos.x = light6PosX;
		LightPos.y = light6PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light6PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light6Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light6State;
	}

// ===============
// LIGHT 7
// ===============
	if (light7State != 0.0){
		vec4 LightColor = vec4(light7ColorR,light7ColorG,light7ColorB,light7Luminosity);
		vec4 AmbientColor = vec4(light7AmbientR,light7AmbientG,light7AmbientB,light7AmbientLuminosity);
		vec3 Falloff = vec3(light7Falloffv1,light7Falloffv2,light7Falloffv3);

		LightPos.x = light7PosX;
		LightPos.y = light7PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light7PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light7Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light7State;
	}

// ===============
// LIGHT 8
// ===============
	if (light8State != 0.0){
		vec4 LightColor = vec4(light8ColorR,light8ColorG,light8ColorB,light8Luminosity);
		vec4 AmbientColor = vec4(light8AmbientR,light8AmbientG,light8AmbientB,light8AmbientLuminosity);
		vec3 Falloff = vec3(light8Falloffv1,light8Falloffv2,light8Falloffv3);

		LightPos.x = light8PosX;
		LightPos.y = light8PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light8PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light8Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light8State;
	}

// ===============
// LIGHT 9
// ===============
	if (light9State != 0.0){
		vec4 LightColor = vec4(light9ColorR,light9ColorG,light9ColorB,light9Luminosity);
		vec4 AmbientColor = vec4(light9AmbientR,light9AmbientG,light9AmbientB,light9AmbientLuminosity);
		vec3 Falloff = vec3(light9Falloffv1,light9Falloffv2,light9Falloffv3);

		LightPos.x = light9PosX;
		LightPos.y = light9PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light9PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light9Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light9State;
	}

// ===============
// LIGHT 10
// ===============
	if (light10State != 0.0){
		vec4 LightColor = vec4(light10ColorR,light10ColorG,light10ColorB,light10Luminosity);
		vec4 AmbientColor = vec4(light10AmbientR,light10AmbientG,light10AmbientB,light10AmbientLuminosity);
		vec3 Falloff = vec3(light10Falloffv1,light10Falloffv2,light10Falloffv3);

		LightPos.x = light10PosX;
		LightPos.y = light10PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light10PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light10Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light10State;
	}

// ===============
// LIGHT 11
// ===============
	if (light11State != 0.0){
		vec4 LightColor = vec4(light11ColorR,light11ColorG,light11ColorB,light11Luminosity);
		vec4 AmbientColor = vec4(light11AmbientR,light11AmbientG,light11AmbientB,light11AmbientLuminosity);
		vec3 Falloff = vec3(light11Falloffv1,light11Falloffv2,light11Falloffv3);

		LightPos.x = light11PosX;
		LightPos.y = light11PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light11PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light11Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light11State;
	}

// ===============
// LIGHT 12
// ===============
	if (light12State != 0.0){
		vec4 LightColor = vec4(light12ColorR,light12ColorG,light12ColorB,light12Luminosity);
		vec4 AmbientColor = vec4(light12AmbientR,light12AmbientG,light12AmbientB,light12AmbientLuminosity);
		vec3 Falloff = vec3(light12Falloffv1,light12Falloffv2,light12Falloffv3);

		LightPos.x = light12PosX;
		LightPos.y = light12PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light12PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light12Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light12State;
	}

// ===============
// LIGHT 13
// ===============
	if (light13State != 0.0){
		vec4 LightColor = vec4(light13ColorR,light13ColorG,light13ColorB,light13Luminosity);
		vec4 AmbientColor = vec4(light13AmbientR,light13AmbientG,light13AmbientB,light13AmbientLuminosity);
		vec3 Falloff = vec3(light13Falloffv1,light13Falloffv2,light13Falloffv3);

		LightPos.x = light13PosX;
		LightPos.y = light13PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light13PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light13Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light13State;
	}

// ===============
// LIGHT 14
// ===============
	if (light14State != 0.0){
		vec4 LightColor = vec4(light14ColorR,light14ColorG,light14ColorB,light14Luminosity);
		vec4 AmbientColor = vec4(light14AmbientR,light14AmbientG,light14AmbientB,light14AmbientLuminosity);
		vec3 Falloff = vec3(light14Falloffv1,light14Falloffv2,light14Falloffv3);

		LightPos.x = light14PosX;
		LightPos.y = light14PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light14PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light14Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light14State;
	}

// ===============
// LIGHT 15
// ===============
	if (light15State != 0.0){
		vec4 LightColor = vec4(light15ColorR,light15ColorG,light15ColorB,light15Luminosity);
		vec4 AmbientColor = vec4(light15AmbientR,light15AmbientG,light15AmbientB,light15AmbientLuminosity);
		vec3 Falloff = vec3(light15Falloffv1,light15Falloffv2,light15Falloffv3);

		LightPos.x = light15PosX;
		LightPos.y = light15PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light15PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light15Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light15State;
	}

// ===============
// LIGHT 16
// ===============
	if (light16State != 0.0){
		vec4 LightColor = vec4(light16ColorR,light16ColorG,light16ColorB,light16Luminosity);
		vec4 AmbientColor = vec4(light16AmbientR,light16AmbientG,light16AmbientB,light16AmbientLuminosity);
		vec3 Falloff = vec3(light16Falloffv1,light16Falloffv2,light16Falloffv3);

		LightPos.x = light16PosX;
		LightPos.y = light16PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light16PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light16Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light16State;
	}

// ===============
// LIGHT 17
// ===============
	if (light17State != 0.0){
		vec4 LightColor = vec4(light17ColorR,light17ColorG,light17ColorB,light17Luminosity);
		vec4 AmbientColor = vec4(light17AmbientR,light17AmbientG,light17AmbientB,light17AmbientLuminosity);
		vec3 Falloff = vec3(light17Falloffv1,light17Falloffv2,light17Falloffv3);

		LightPos.x = light17PosX;
		LightPos.y = light17PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light17PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light17Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light17State;
	}

// ===============
// LIGHT 18
// ===============
	if (light18State != 0.0){
		vec4 LightColor = vec4(light18ColorR,light18ColorG,light18ColorB,light18Luminosity);
		vec4 AmbientColor = vec4(light18AmbientR,light18AmbientG,light18AmbientB,light18AmbientLuminosity);
		vec3 Falloff = vec3(light18Falloffv1,light18Falloffv2,light18Falloffv3);

		LightPos.x = light18PosX;
		LightPos.y = light18PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light18PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light18Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light18State;
	}

// ===============
// LIGHT 19
// ===============
	if (light19State != 0.0){
		vec4 LightColor = vec4(light19ColorR,light19ColorG,light19ColorB,light19Luminosity);
		vec4 AmbientColor = vec4(light19AmbientR,light19AmbientG,light19AmbientB,light19AmbientLuminosity);
		vec3 Falloff = vec3(light19Falloffv1,light19Falloffv2,light19Falloffv3);

		LightPos.x = light19PosX;
		LightPos.y = light19PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light19PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light19Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light19State;
	}

// ===============
// LIGHT 20
// ===============
	if (light20State != 0.0){
		vec4 LightColor = vec4(light20ColorR,light20ColorG,light20ColorB,light20Luminosity);
		vec4 AmbientColor = vec4(light20AmbientR,light20AmbientG,light20AmbientB,light20AmbientLuminosity);
		vec3 Falloff = vec3(light20Falloffv1,light20Falloffv2,light20Falloffv3);

		LightPos.x = light20PosX;
		LightPos.y = light20PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light20PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light20Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light20State;
	}

// ===============
// LIGHT 21
// ===============
	if (light21State != 0.0){
		vec4 LightColor = vec4(light21ColorR,light21ColorG,light21ColorB,light21Luminosity);
		vec4 AmbientColor = vec4(light21AmbientR,light21AmbientG,light21AmbientB,light21AmbientLuminosity);
		vec3 Falloff = vec3(light21Falloffv1,light21Falloffv2,light21Falloffv3);

		LightPos.x = light21PosX;
		LightPos.y = light21PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light21PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light21Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light21State;
	}

// ===============
// LIGHT 22
// ===============
	if (light22State != 0.0){
		vec4 LightColor = vec4(light22ColorR,light22ColorG,light22ColorB,light22Luminosity);
		vec4 AmbientColor = vec4(light22AmbientR,light22AmbientG,light22AmbientB,light22AmbientLuminosity);
		vec3 Falloff = vec3(light22Falloffv1,light22Falloffv2,light22Falloffv3);

		LightPos.x = light22PosX;
		LightPos.y = light22PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light22PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light22Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light22State;
	}

// ===============
// LIGHT 23
// ===============
	if (light23State != 0.0){
		vec4 LightColor = vec4(light23ColorR,light23ColorG,light23ColorB,light23Luminosity);
		vec4 AmbientColor = vec4(light23AmbientR,light23AmbientG,light23AmbientB,light23AmbientLuminosity);
		vec3 Falloff = vec3(light23Falloffv1,light23Falloffv2,light23Falloffv3);

		LightPos.x = light23PosX;
		LightPos.y = light23PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light23PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light23Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light23State;
	}

// ===============
// LIGHT 24
// ===============
	if (light24State != 0.0){
		vec4 LightColor = vec4(light24ColorR,light24ColorG,light24ColorB,light24Luminosity);
		vec4 AmbientColor = vec4(light24AmbientR,light24AmbientG,light24AmbientB,light24AmbientLuminosity);
		vec3 Falloff = vec3(light24Falloffv1,light24Falloffv2,light24Falloffv3);

		LightPos.x = light24PosX;
		LightPos.y = light24PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light24PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light24Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light24State;
	}

// ===============
// LIGHT 25
// ===============
	if (light25State != 0.0){
		vec4 LightColor = vec4(light25ColorR,light25ColorG,light25ColorB,light25Luminosity);
		vec4 AmbientColor = vec4(light25AmbientR,light25AmbientG,light25AmbientB,light25AmbientLuminosity);
		vec3 Falloff = vec3(light25Falloffv1,light25Falloffv2,light25Falloffv3);

		LightPos.x = light25PosX;
		LightPos.y = light25PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light25PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light25Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light25State;
	}

// ===============
// LIGHT 26
// ===============
	if (light26State != 0.0){
		vec4 LightColor = vec4(light26ColorR,light26ColorG,light26ColorB,light26Luminosity);
		vec4 AmbientColor = vec4(light26AmbientR,light26AmbientG,light26AmbientB,light26AmbientLuminosity);
		vec3 Falloff = vec3(light26Falloffv1,light26Falloffv2,light26Falloffv3);

		LightPos.x = light26PosX;
		LightPos.y = light26PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light26PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light26Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light26State;
	}

// ===============
// LIGHT 27
// ===============
	if (light27State != 0.0){
		vec4 LightColor = vec4(light27ColorR,light27ColorG,light27ColorB,light27Luminosity);
		vec4 AmbientColor = vec4(light27AmbientR,light27AmbientG,light27AmbientB,light27AmbientLuminosity);
		vec3 Falloff = vec3(light27Falloffv1,light27Falloffv2,light27Falloffv3);

		LightPos.x = light27PosX;
		LightPos.y = light27PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light27PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light27Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light27State;
	}

// ===============
// LIGHT 28
// ===============
	if (light28State != 0.0){
		vec4 LightColor = vec4(light28ColorR,light28ColorG,light28ColorB,light28Luminosity);
		vec4 AmbientColor = vec4(light28AmbientR,light28AmbientG,light28AmbientB,light28AmbientLuminosity);
		vec3 Falloff = vec3(light28Falloffv1,light28Falloffv2,light28Falloffv3);

		LightPos.x = light28PosX;
		LightPos.y = light28PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light28PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light28Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light28State;
	}

// ===============
// LIGHT 29
// ===============
	if (light29State != 0.0){
		vec4 LightColor = vec4(light29ColorR,light29ColorG,light29ColorB,light29Luminosity);
		vec4 AmbientColor = vec4(light29AmbientR,light29AmbientG,light29AmbientB,light29AmbientLuminosity);
		vec3 Falloff = vec3(light29Falloffv1,light29Falloffv2,light29Falloffv3);

		LightPos.x = light29PosX;
		LightPos.y = light29PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light29PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light29Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light29State;
	}

// ===============
// LIGHT 30
// ===============
	if (light30State != 0.0){
		vec4 LightColor = vec4(light30ColorR,light30ColorG,light30ColorB,light30Luminosity);
		vec4 AmbientColor = vec4(light30AmbientR,light30AmbientG,light30AmbientB,light30AmbientLuminosity);
		vec3 Falloff = vec3(light30Falloffv1,light30Falloffv2,light30Falloffv3);

		LightPos.x = light30PosX;
		LightPos.y = light30PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light30PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light30Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light30State;
	}

// ===============
// LIGHT 31
// ===============
	if (light31State != 0.0){
		vec4 LightColor = vec4(light31ColorR,light31ColorG,light31ColorB,light31Luminosity);
		vec4 AmbientColor = vec4(light31AmbientR,light31AmbientG,light31AmbientB,light31AmbientLuminosity);
		vec3 Falloff = vec3(light31Falloffv1,light31Falloffv2,light31Falloffv3);

		LightPos.x = light31PosX;
		LightPos.y = light31PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light31PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light31Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light31State;
	}

// ===============
// LIGHT 32
// ===============
	if (light32State != 0.0){
		vec4 LightColor = vec4(light32ColorR,light32ColorG,light32ColorB,light32Luminosity);
		vec4 AmbientColor = vec4(light32AmbientR,light32AmbientG,light32AmbientB,light32AmbientLuminosity);
		vec3 Falloff = vec3(light32Falloffv1,light32Falloffv2,light32Falloffv3);

		LightPos.x = light32PosX;
		LightPos.y = light32PosY;
		LightPos.y = 1.0 - LightPos.y;
		LightPos.z = light32PosZ;
		vec3 LightDir = vec3(LightPos.xy - (gl_FragCoord.xy / Resolution.xy), LightPos.z);

		LightDir.x *= Resolution.x / Resolution.y;

		float D = length(LightDir);
		D = (D < light32Distance) ? D : 1000.0;

		vec3 N = normalize(NormalMap * 2.0 - 1.0);
		vec3 L = normalize(LightDir);

		vec3 Diffuse = (LightColor.rgb * LightColor.a) * max(dot(N, L), 0.0);
		vec3 Ambient = AmbientColor.rgb * AmbientColor.a;

		float Attenuation = clamp( 1.0 - ( Falloff.x + (Falloff.y*D*D) + (Falloff.z*D*D*D*D*D) ),0.0,1.0);

		vec3 Intensity = Ambient + Diffuse * Attenuation;
		vec3 FinalColor = DiffuseColor.rgb * Intensity;
		gl_FragColor = (vColor * vec4(FinalColor, DiffuseColor.a) * front.a );

		Sum += FinalColor * light32State;
	}

// ===============
// SHADER OUTPUT
// ===============
	// Multiple Lights
	// "* front.a" at the end to use NormalMaps with alpha and avoid some glitches
	gl_FragColor = (vec4(Sum, DiffuseColor.a)) * front.a;
}
