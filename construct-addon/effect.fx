// Effect made by Donelwero and Edited by Matriax based on: https:// github.com/mattdesl/lwjgl-basics/wiki/ShaderLesson6
// Matriax: Passed all the variables to adjust in C2 , how the light X/Y is applied to set down the point desired and allowing to use normal maps with alpha channels.
// Rev 1.3 Edited for C3 by Mikal
// 	Cleaned up dead code, removed redundant calulations.
// 	Changed background sampler to use relative locations not vTex
// 		mediump vec2 n = (vTex - srcStart) / (srcEnd - srcStart);
// 		lowp vec4 DiffuseColor = texture2D(samplerBack, mix(destStart, destEnd, n));
// Rev 1.4 Edited by Mikal
// 	Updated with Spotlight effect.
// 	Add three new parameters to the end of the effect list with default values.
// 	Light * Distance Limit range of 0-2, beyond this distance the normal map main light is greatly diminished (ambient not effected.)
// Rev 1.5 Edited by Everade
// 	Increased support for up to 32 simultaneous lights.
// Rev 1.6 Edited by Everade
// 	Adjusted falloff formula for better light control.
// 	Updated and improved addon and parameter descriptions.

// Note: if possible don't use 'precision highp float'!  This will
// unnecessarily reduce performance on mobile devices.  Prefer to
// always specify an appropriate precision level.  As a guide, use:
// lowp - for color and alpha values returned by samplers
// mediump - for texture co-ordinates
// highp - only where increased precision is necessary to calculate the correct value

// The current texture co-ordinates (required).  Note these are normalised to [0, 1] float range, so
// (1, 1) is always the bottom right corner and (0.5, 0.5) is always the middle.

// The sampler to retrieve pixels from the foreground texture (required)

// Optional: for sampling the background.  Uncomment all three if background
// sampling is required, and set 'blends-background' to 'true' in the XML file.

// Optional parameters.  Uncomment any lines and they will automatically
// receive the correct values from the runtime.  Be sure not to accidentally
// uncomment any parameters you do not really need - doing so can reduce performance.
// uniform mediump float pixelWidth;		// width of a pixel in texture co-ordinates
// uniform mediump float pixelHeight;		// height of a pixel in texture co-ordinates
// uniform mediump float layerScale;		// scale of the current layer
// uniform mediump float seconds;			// number of seconds elapsed since start of game

// Add any custom parameters below as uniform floats, e.g.
// uniform mediump float exampleParam;
// where 'exampleParam' is specified as the 'uniform' for a parameter
// in the XML file.
precision highp float;

// Dynamic Light
varying mediump vec2 vTex;
uniform lowp sampler2D samplerFront;
uniform lowp sampler2D samplerBack;
uniform mediump vec2 destStart;
uniform mediump vec2 destEnd;
uniform mediump vec2 srcEnd;
uniform mediump vec2 srcStart;

// Light 1
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

// Resolution
uniform float screenXResolution;
uniform float screenYResolution;
vec2 Resolution;

// Used to detect if the light is enabled or disabled
uniform float light1State01;
uniform float light2State01;
uniform float light3State01;
uniform float light4State01;
uniform float light5State01;
uniform float light6State01;
uniform float light7State01;
uniform float light8State01;
uniform float light9State01;
uniform float light10State01;
uniform float light11State01;
uniform float light12State01;
uniform float light13State01;
uniform float light14State01;
uniform float light15State01;
uniform float light16State01;
uniform float light17State01;
uniform float light18State01;
uniform float light19State01;
uniform float light20State01;
uniform float light21State01;
uniform float light22State01;
uniform float light23State01;
uniform float light24State01;
uniform float light25State01;
uniform float light26State01;
uniform float light27State01;
uniform float light28State01;
uniform float light29State01;
uniform float light30State01;
uniform float light31State01;
uniform float light32State01;

void main(void)
{
	// Retrieve front and back pixels
	lowp vec4 front = texture2D(samplerFront, vTex);
	lowp vec4 back = texture2D(samplerBack, mix(destStart, destEnd, vTex));

	// lowp vec4 DiffuseColor  = texture2D(samplerBack, mix(destStart, destEnd, vTex));
	mediump vec2 n = (vTex - srcStart) / (srcEnd - srcStart);
	lowp vec4 DiffuseColor = texture2D(samplerBack, mix(destStart, destEnd, n));
	lowp vec4 light2DiffuseColor = DiffuseColor;
	lowp vec4 light3DiffuseColor = DiffuseColor;
	lowp vec4 light4DiffuseColor = DiffuseColor;
	lowp vec4 light5DiffuseColor = DiffuseColor;
	lowp vec4 light6DiffuseColor = DiffuseColor;
	lowp vec4 light7DiffuseColor = DiffuseColor;
	lowp vec4 light8DiffuseColor = DiffuseColor;
	lowp vec4 light9DiffuseColor = DiffuseColor;
	lowp vec4 light10DiffuseColor = DiffuseColor;
	lowp vec4 light11DiffuseColor = DiffuseColor;
	lowp vec4 light12DiffuseColor = DiffuseColor;
	lowp vec4 light13DiffuseColor = DiffuseColor;
	lowp vec4 light14DiffuseColor = DiffuseColor;
	lowp vec4 light15DiffuseColor = DiffuseColor;
	lowp vec4 light16DiffuseColor = DiffuseColor;
	lowp vec4 light17DiffuseColor = DiffuseColor;
	lowp vec4 light18DiffuseColor = DiffuseColor;
	lowp vec4 light19DiffuseColor = DiffuseColor;
	lowp vec4 light20DiffuseColor = DiffuseColor;
	lowp vec4 light21DiffuseColor = DiffuseColor;
	lowp vec4 light22DiffuseColor = DiffuseColor;
	lowp vec4 light23DiffuseColor = DiffuseColor;
	lowp vec4 light24DiffuseColor = DiffuseColor;
	lowp vec4 light25DiffuseColor = DiffuseColor;
	lowp vec4 light26DiffuseColor = DiffuseColor;
	lowp vec4 light27DiffuseColor = DiffuseColor;
	lowp vec4 light28DiffuseColor = DiffuseColor;
	lowp vec4 light29DiffuseColor = DiffuseColor;
	lowp vec4 light30DiffuseColor = DiffuseColor;
	lowp vec4 light31DiffuseColor = DiffuseColor;
	lowp vec4 light32DiffuseColor = DiffuseColor;

	mediump vec3 light1NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light2NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light3NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light4NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light5NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light6NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light7NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light8NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light9NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light10NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light11NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light12NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light13NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light14NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light15NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light16NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light17NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light18NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light19NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light20NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light21NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light22NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light23NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light24NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light25NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light26NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light27NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light28NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light29NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light30NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light31NormalMap  = texture2D(samplerFront, vTex).rgb;
	mediump vec3 light32NormalMap  = texture2D(samplerFront, vTex).rgb;

	vec3 Sum = vec3(0.0);

// *************************************************************************************************************
// Start - LIGHT 1 *********************************************************************************************
// *************************************************************************************************************
{
	// Light 1 Constants
	vec3 light1Pos;
	vec4 light1Color = vec4(light1ColorR,light1ColorG,light1ColorB,light1Luminosity);
	vec4 light1AmbientColor = vec4(light1AmbientR,light1AmbientG,light1AmbientB,light1AmbientLuminosity);
	vec3 light1Falloff = vec3(light1Falloffv1,light1Falloffv2,light1Falloffv3);

	// Delta position of Light
	// light1Pos.x = light1PosX;
	light1Pos.x = light1PosX;
	light1Pos.y = light1PosY;
	light1Pos.y = 1.0 - light1Pos.y;
	light1Pos.z = light1PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light1Dir = vec3(light1Pos.xy - (gl_FragCoord.xy / Resolution.xy), light1Pos.z);

	// Correct for aspect ratio
	light1Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light1Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light1Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light1NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light1Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light1Diffuse = (light1Color.rgb * light1Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light1Ambient = light1AmbientColor.rgb * light1AmbientColor.a;

	// calculate attenuation
	float light1Attenuation = clamp( 1.0 - ( light1Falloff.x + (light1Falloff.y*D*D) + (light1Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light1colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	// vec3 light1Intensity = light1Ambient;
	vec3 light1Intensity = light1Ambient + light1Diffuse * light1Attenuation;
	vec3 light1FinalColor = DiffuseColor.rgb * light1Intensity;
	gl_FragColor =  (light1colors * vec4(light1FinalColor, DiffuseColor.a) * front.a );
	
  Sum += light1FinalColor * light1State01;
}

// *************************************************************************************************************
// Start - LIGHT 2 *********************************************************************************************
// *************************************************************************************************************
{
	if (light2State01 != 0.0){
	// Light 2 Constants
	vec3 light2Pos;
	vec4 light2Color = vec4(light2ColorR,light2ColorG,light2ColorB,light2Luminosity);
	vec4 light2AmbientColor = vec4(light2AmbientR,light2AmbientG,light2AmbientB,light2AmbientLuminosity);
	vec3 light2Falloff = vec3(light2Falloffv1,light2Falloffv2,light2Falloffv3);

	// Delta position of Light
	light2Pos.x = light2PosX;
	light2Pos.y = light2PosY;
	light2Pos.y = 1.0 - light2Pos.y;
	light2Pos.z = light2PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light2Dir = vec3(light2Pos.xy - (gl_FragCoord.xy / Resolution.xy), light2Pos.z);

	// Correct for aspect ratio
	light2Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light2Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light2Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light2NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light2Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light2Diffuse = (light2Color.rgb * light2Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light2Ambient = light2AmbientColor.rgb * light2AmbientColor.a;

	// calculate attenuation
	float light2Attenuation = clamp( 1.0 - ( light2Falloff.x + (light2Falloff.y*D*D) + (light2Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light2colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light2Intensity = light2Ambient + light2Diffuse * light2Attenuation;
	vec3 light2FinalColor = light2DiffuseColor.rgb * light2Intensity;
	gl_FragColor =  (light2colors * vec4(light2FinalColor, light2DiffuseColor.a) * front.a );

  Sum += light2FinalColor * light2State01;
  }
}

// *************************************************************************************************************
// Start - LIGHT 3 *********************************************************************************************
// *************************************************************************************************************

{
	if (light3State01 != 0.0){
	// Light 3 Constants
	vec3 light3Pos;
	vec4 light3Color = vec4(light3ColorR,light3ColorG,light3ColorB,light3Luminosity);
	vec4 light3AmbientColor = vec4(light3AmbientR,light3AmbientG,light3AmbientB,light3AmbientLuminosity);
	vec3 light3Falloff = vec3(light3Falloffv1,light3Falloffv2,light3Falloffv3);

	// Delta position of Light
	light3Pos.x = light3PosX;
	light3Pos.y = light3PosY;
	light3Pos.y = 1.0 - light3Pos.y;
	light3Pos.z = light3PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light3Dir = vec3(light3Pos.xy - (gl_FragCoord.xy / Resolution.xy), light3Pos.z);

	// Correct for aspect ratio
	light3Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light3Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light3Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light3NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light3Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light3Diffuse = (light3Color.rgb * light3Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light3Ambient = light3AmbientColor.rgb * light3AmbientColor.a;

	// calculate attenuation
	float light3Attenuation = clamp( 1.0 - ( light3Falloff.x + (light3Falloff.y*D*D) + (light3Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light3colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light3Intensity = light3Ambient + light3Diffuse * light3Attenuation;
	vec3 light3FinalColor = light3DiffuseColor.rgb * light3Intensity;
	gl_FragColor =  (light3colors * vec4(light3FinalColor, light3DiffuseColor.a) * front.a );

  Sum += light3FinalColor * light3State01;
	}
}
// *************************************************************************************************************
// Start - LIGHT 4 *********************************************************************************************
// *************************************************************************************************************

{
	if (light4State01 != 0.0){
	// Light 4 Constants
	vec3 light4Pos;
	vec4 light4Color = vec4(light4ColorR,light4ColorG,light4ColorB,light4Luminosity);
	vec4 light4AmbientColor = vec4(light4AmbientR,light4AmbientG,light4AmbientB,light4AmbientLuminosity);
	vec3 light4Falloff = vec3(light4Falloffv1,light4Falloffv2,light4Falloffv3);
	
	// Delta position of Light
	light4Pos.x = light4PosX;
	light4Pos.y = light4PosY;
	light4Pos.y = 1.0 - light4Pos.y;
	light4Pos.z = light4PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light4Dir = vec3(light4Pos.xy - (gl_FragCoord.xy / Resolution.xy), light4Pos.z);

	// Correct for aspect ratio
	light4Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light4Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light4Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light4NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light4Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light4Diffuse = (light4Color.rgb * light4Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light4Ambient = light4AmbientColor.rgb * light4AmbientColor.a;

	// calculate attenuation
	float light4Attenuation = clamp( 1.0 - ( light4Falloff.x + (light4Falloff.y*D*D) + (light4Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light4colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light4Intensity = light4Ambient + light4Diffuse * light4Attenuation;
	vec3 light4FinalColor = light4DiffuseColor.rgb * light4Intensity;
	gl_FragColor =  (light4colors * vec4(light4FinalColor, light4DiffuseColor.a) * front.a );

  Sum += light4FinalColor * light4State01;
	}
}

// *************************************************************************************************************
// Start - LIGHT 5 *********************************************************************************************
// *************************************************************************************************************

{
	if (light5State01 != 0.0){
	// Light 5 Constants
	vec3 light5Pos;
	vec4 light5Color = vec4(light5ColorR,light5ColorG,light5ColorB,light5Luminosity);
	vec4 light5AmbientColor = vec4(light5AmbientR,light5AmbientG,light5AmbientB,light5AmbientLuminosity);
	vec3 light5Falloff = vec3(light5Falloffv1,light5Falloffv2,light5Falloffv3);

	// Delta position of Light
	light5Pos.x = light5PosX;
	light5Pos.y = light5PosY;
	light5Pos.y = 1.0 - light5Pos.y;
	light5Pos.z = light5PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light5Dir = vec3(light5Pos.xy - (gl_FragCoord.xy / Resolution.xy), light5Pos.z);

	// Correct for aspect ratio
	light5Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light5Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light5Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light5NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light5Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light5Diffuse = (light5Color.rgb * light5Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light5Ambient = light5AmbientColor.rgb * light5AmbientColor.a;

	// calculate attenuation
	float light5Attenuation = clamp( 1.0 - ( light5Falloff.x + (light5Falloff.y*D*D) + (light5Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light5colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light5Intensity = light5Ambient + light5Diffuse * light5Attenuation;
	vec3 light5FinalColor = light5DiffuseColor.rgb * light5Intensity;
	gl_FragColor =  (light5colors * vec4(light5FinalColor, light5DiffuseColor.a) * front.a );

  Sum += light5FinalColor * light5State01;
	}
}

// *************************************************************************************************************
// Start - LIGHT 6 *********************************************************************************************
// *************************************************************************************************************

{
	if (light6State01 != 0.0){
	// Light 6 Constants
	vec3 light6Pos;
	vec4 light6Color = vec4(light6ColorR,light6ColorG,light6ColorB,light6Luminosity);
	vec4 light6AmbientColor = vec4(light6AmbientR,light6AmbientG,light6AmbientB,light6AmbientLuminosity);
	vec3 light6Falloff = vec3(light6Falloffv1,light6Falloffv2,light6Falloffv3);

	// Delta position of Light
	light6Pos.x = light6PosX;
	light6Pos.y = light6PosY;
	light6Pos.y = 1.0 - light6Pos.y;
	light6Pos.z = light6PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light6Dir = vec3(light6Pos.xy - (gl_FragCoord.xy / Resolution.xy), light6Pos.z);

	// Correct for aspect ratio
	light6Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light6Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light6Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light6NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light6Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light6Diffuse = (light6Color.rgb * light6Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light6Ambient = light6AmbientColor.rgb * light6AmbientColor.a;

	// calculate attenuation
	float light6Attenuation = clamp( 1.0 - ( light6Falloff.x + (light6Falloff.y*D*D) + (light6Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light6colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light6Intensity = light6Ambient + light6Diffuse * light6Attenuation;
	vec3 light6FinalColor = light6DiffuseColor.rgb * light6Intensity;
	gl_FragColor =  (light6colors * vec4(light6FinalColor, light6DiffuseColor.a) * front.a );

  Sum += light6FinalColor * light6State01;
	}
}

// *************************************************************************************************************
// Start - LIGHT 7 *********************************************************************************************
// *************************************************************************************************************

{
	if (light7State01 != 0.0){
	// Light 7 Constants
	vec3 light7Pos;
	vec4 light7Color = vec4(light7ColorR,light7ColorG,light7ColorB,light7Luminosity);
	vec4 light7AmbientColor = vec4(light7AmbientR,light7AmbientG,light7AmbientB,light7AmbientLuminosity);
	vec3 light7Falloff = vec3(light7Falloffv1,light7Falloffv2,light7Falloffv3);

	// Delta position of Light
	light7Pos.x = light7PosX;
	light7Pos.y = light7PosY;
	light7Pos.y = 1.0 - light7Pos.y;
	light7Pos.z = light7PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light7Dir = vec3(light7Pos.xy - (gl_FragCoord.xy / Resolution.xy), light7Pos.z);

	// Correct for aspect ratio
	light7Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light7Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light7Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light7NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light7Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light7Diffuse = (light7Color.rgb * light7Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light7Ambient = light7AmbientColor.rgb * light7AmbientColor.a;

	// calculate attenuation
	float light7Attenuation = clamp( 1.0 - ( light7Falloff.x + (light7Falloff.y*D*D) + (light7Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light7colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light7Intensity = light7Ambient + light7Diffuse * light7Attenuation;
	vec3 light7FinalColor = light7DiffuseColor.rgb * light7Intensity;
	gl_FragColor =  (light7colors * vec4(light7FinalColor, light7DiffuseColor.a) * front.a );

  Sum += light7FinalColor * light7State01;
	}
}

// *************************************************************************************************************
// Start - LIGHT 8 *********************************************************************************************
// *************************************************************************************************************

{
	if (light8State01 != 0.0){
	// Light 8 Constants
	vec3 light8Pos;
	vec4 light8Color = vec4(light8ColorR,light8ColorG,light8ColorB,light8Luminosity);
	vec4 light8AmbientColor = vec4(light8AmbientR,light8AmbientG,light8AmbientB,light8AmbientLuminosity);
	vec3 light8Falloff = vec3(light8Falloffv1,light8Falloffv2,light8Falloffv3);

	// Delta position of Light
	light8Pos.x = light8PosX;
	light8Pos.y = light8PosY;
	light8Pos.y = 1.0 - light8Pos.y;
	light8Pos.z = light8PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light8Dir = vec3(light8Pos.xy - (gl_FragCoord.xy / Resolution.xy), light8Pos.z);

	// Correct for aspect ratio
	light8Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light8Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light8Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light8NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light8Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light8Diffuse = (light8Color.rgb * light8Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light8Ambient = light8AmbientColor.rgb * light8AmbientColor.a;

	// calculate attenuation
	float light8Attenuation = clamp( 1.0 - ( light8Falloff.x + (light8Falloff.y*D*D) + (light8Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light8colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light8Intensity = light8Ambient + light8Diffuse * light8Attenuation;
	vec3 light8FinalColor = light8DiffuseColor.rgb * light8Intensity;
	gl_FragColor =  (light8colors * vec4(light8FinalColor, light8DiffuseColor.a) * front.a );

  Sum += light8FinalColor * light8State01;
	}
}

// *************************************************************************************************************
// Start - LIGHT 9 *********************************************************************************************
// *************************************************************************************************************

{
	if (light9State01 != 0.0){
	// Light 9 Constants
	vec3 light9Pos;
	vec4 light9Color = vec4(light9ColorR,light9ColorG,light9ColorB,light9Luminosity);
	vec4 light9AmbientColor = vec4(light9AmbientR,light9AmbientG,light9AmbientB,light9AmbientLuminosity);
	vec3 light9Falloff = vec3(light9Falloffv1,light9Falloffv2,light9Falloffv3);

	// Delta position of Light
	light9Pos.x = light9PosX;
	light9Pos.y = light9PosY;
	light9Pos.y = 1.0 - light9Pos.y;
	light9Pos.z = light9PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light9Dir = vec3(light9Pos.xy - (gl_FragCoord.xy / Resolution.xy), light9Pos.z);

	// Correct for aspect ratio
	light9Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light9Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light9Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light9NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light9Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light9Diffuse = (light9Color.rgb * light9Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light9Ambient = light9AmbientColor.rgb * light9AmbientColor.a;

	// calculate attenuation
	float light9Attenuation = clamp( 1.0 - ( light9Falloff.x + (light9Falloff.y*D*D) + (light9Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light9colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light9Intensity = light9Ambient + light9Diffuse * light9Attenuation;
	vec3 light9FinalColor = light9DiffuseColor.rgb * light9Intensity;
	gl_FragColor =  (light9colors * vec4(light9FinalColor, light9DiffuseColor.a) * front.a );

  Sum += light9FinalColor * light9State01;
	}
}

// *************************************************************************************************************
// Start - LIGHT 10 *********************************************************************************************
// *************************************************************************************************************

{
	if (light10State01 != 0.0){
	// Light 10 Constants
	vec3 light10Pos;
	vec4 light10Color = vec4(light10ColorR,light10ColorG,light10ColorB,light10Luminosity);
	vec4 light10AmbientColor = vec4(light10AmbientR,light10AmbientG,light10AmbientB,light10AmbientLuminosity);
	vec3 light10Falloff = vec3(light10Falloffv1,light10Falloffv2,light10Falloffv3);

	// Delta position of Light
	light10Pos.x = light10PosX;
	light10Pos.y = light10PosY;
	light10Pos.y = 1.0 - light10Pos.y;
	light10Pos.z = light10PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light10Dir = vec3(light10Pos.xy - (gl_FragCoord.xy / Resolution.xy), light10Pos.z);

	// Correct for aspect ratio
	light10Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light10Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light10Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light10NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light10Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light10Diffuse = (light10Color.rgb * light10Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light10Ambient = light10AmbientColor.rgb * light10AmbientColor.a;

	// calculate attenuation
	float light10Attenuation = clamp( 1.0 - ( light10Falloff.x + (light10Falloff.y*D*D) + (light10Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light10colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light10Intensity = light10Ambient + light10Diffuse * light10Attenuation;
	vec3 light10FinalColor = light10DiffuseColor.rgb * light10Intensity;
	gl_FragColor =  (light10colors * vec4(light10FinalColor, light10DiffuseColor.a) * front.a );

  Sum += light10FinalColor * light10State01;
	}
}

// *************************************************************************************************************
// Start - light11 *********************************************************************************************
// *************************************************************************************************************

{
	if (light11State01 != 0.0){
	// Light 11 Constants
	vec3 light11Pos;
	vec4 light11Color = vec4(light11ColorR,light11ColorG,light11ColorB,light11Luminosity);
	vec4 light11AmbientColor = vec4(light11AmbientR,light11AmbientG,light11AmbientB,light11AmbientLuminosity);
	vec3 light11Falloff = vec3(light11Falloffv1,light11Falloffv2,light11Falloffv3);

	// Delta position of Light
	light11Pos.x = light11PosX;
	light11Pos.y = light11PosY;
	light11Pos.y = 1.0 - light11Pos.y;
	light11Pos.z = light11PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light11Dir = vec3(light11Pos.xy - (gl_FragCoord.xy / Resolution.xy), light11Pos.z);

	// Correct for aspect ratio
	light11Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light11Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light11Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light11NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light11Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light11Diffuse = (light11Color.rgb * light11Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light11Ambient = light11AmbientColor.rgb * light11AmbientColor.a;

	// calculate attenuation
	float light11Attenuation = clamp( 1.0 - ( light11Falloff.x + (light11Falloff.y*D*D) + (light11Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light11colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light11Intensity = light11Ambient + light11Diffuse * light11Attenuation;
	vec3 light11FinalColor = light11DiffuseColor.rgb * light11Intensity;
	gl_FragColor =  (light11colors * vec4(light11FinalColor, light11DiffuseColor.a) * front.a );

  Sum += light11FinalColor * light11State01;
	}
}

// *************************************************************************************************************
// Start - light12 *********************************************************************************************
// *************************************************************************************************************

{
	if (light12State01 != 0.0){
	// Light 12 Constants
	vec3 light12Pos;
	vec4 light12Color = vec4(light12ColorR,light12ColorG,light12ColorB,light12Luminosity);
	vec4 light12AmbientColor = vec4(light12AmbientR,light12AmbientG,light12AmbientB,light12AmbientLuminosity);
	vec3 light12Falloff = vec3(light12Falloffv1,light12Falloffv2,light12Falloffv3);

	// Delta position of Light
	light12Pos.x = light12PosX;
	light12Pos.y = light12PosY;
	light12Pos.y = 1.0 - light12Pos.y;
	light12Pos.z = light12PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light12Dir = vec3(light12Pos.xy - (gl_FragCoord.xy / Resolution.xy), light12Pos.z);

	// Correct for aspect ratio
	light12Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light12Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light12Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light12NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light12Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light12Diffuse = (light12Color.rgb * light12Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light12Ambient = light12AmbientColor.rgb * light12AmbientColor.a;

	// calculate attenuation
	float light12Attenuation = clamp( 1.0 - ( light12Falloff.x + (light12Falloff.y*D*D) + (light12Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light12colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light12Intensity = light12Ambient + light12Diffuse * light12Attenuation;
	vec3 light12FinalColor = light12DiffuseColor.rgb * light12Intensity;
	gl_FragColor =  (light12colors * vec4(light12FinalColor, light12DiffuseColor.a) * front.a );

  Sum += light12FinalColor * light12State01;
	}
}

// *************************************************************************************************************
// Start - light13 *********************************************************************************************
// *************************************************************************************************************

{
	if (light13State01 != 0.0){
	// Light 13 Constants
	vec3 light13Pos;
	vec4 light13Color = vec4(light13ColorR,light13ColorG,light13ColorB,light13Luminosity);
	vec4 light13AmbientColor = vec4(light13AmbientR,light13AmbientG,light13AmbientB,light13AmbientLuminosity);
	vec3 light13Falloff = vec3(light13Falloffv1,light13Falloffv2,light13Falloffv3);

	// Delta position of Light
	light13Pos.x = light13PosX;
	light13Pos.y = light13PosY;
	light13Pos.y = 1.0 - light13Pos.y;
	light13Pos.z = light13PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light13Dir = vec3(light13Pos.xy - (gl_FragCoord.xy / Resolution.xy), light13Pos.z);

	// Correct for aspect ratio
	light13Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light13Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light13Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light13NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light13Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light13Diffuse = (light13Color.rgb * light13Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light13Ambient = light13AmbientColor.rgb * light13AmbientColor.a;

	// calculate attenuation
	float light13Attenuation = clamp( 1.0 - ( light13Falloff.x + (light13Falloff.y*D*D) + (light13Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light13colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light13Intensity = light13Ambient + light13Diffuse * light13Attenuation;
	vec3 light13FinalColor = light13DiffuseColor.rgb * light13Intensity;
	gl_FragColor =  (light13colors * vec4(light13FinalColor, light13DiffuseColor.a) * front.a );

  Sum += light13FinalColor * light13State01;
	}
}

// *************************************************************************************************************
// Start - light14 *********************************************************************************************
// *************************************************************************************************************

{
	if (light14State01 != 0.0){
	// Light 14 Constants
	vec3 light14Pos;
	vec4 light14Color = vec4(light14ColorR,light14ColorG,light14ColorB,light14Luminosity);
	vec4 light14AmbientColor = vec4(light14AmbientR,light14AmbientG,light14AmbientB,light14AmbientLuminosity);
	vec3 light14Falloff = vec3(light14Falloffv1,light14Falloffv2,light14Falloffv3);

	// Delta position of Light
	light14Pos.x = light14PosX;
	light14Pos.y = light14PosY;
	light14Pos.y = 1.0 - light14Pos.y;
	light14Pos.z = light14PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light14Dir = vec3(light14Pos.xy - (gl_FragCoord.xy / Resolution.xy), light14Pos.z);

	// Correct for aspect ratio
	light14Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light14Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light14Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light14NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light14Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light14Diffuse = (light14Color.rgb * light14Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light14Ambient = light14AmbientColor.rgb * light14AmbientColor.a;

	// calculate attenuation
	float light14Attenuation = clamp( 1.0 - ( light14Falloff.x + (light14Falloff.y*D*D) + (light14Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light14colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light14Intensity = light14Ambient + light14Diffuse * light14Attenuation;
	vec3 light14FinalColor = light14DiffuseColor.rgb * light14Intensity;
	gl_FragColor =  (light14colors * vec4(light14FinalColor, light14DiffuseColor.a) * front.a );

  Sum += light14FinalColor * light14State01;
	}
}

// *************************************************************************************************************
// Start - light15 *********************************************************************************************
// *************************************************************************************************************

{
	if (light15State01 != 0.0){
	// Light 15 Constants
	vec3 light15Pos;
	vec4 light15Color = vec4(light15ColorR,light15ColorG,light15ColorB,light15Luminosity);
	vec4 light15AmbientColor = vec4(light15AmbientR,light15AmbientG,light15AmbientB,light15AmbientLuminosity);
	vec3 light15Falloff = vec3(light15Falloffv1,light15Falloffv2,light15Falloffv3);

	// Delta position of Light
	light15Pos.x = light15PosX;
	light15Pos.y = light15PosY;
	light15Pos.y = 1.0 - light15Pos.y;
	light15Pos.z = light15PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light15Dir = vec3(light15Pos.xy - (gl_FragCoord.xy / Resolution.xy), light15Pos.z);

	// Correct for aspect ratio
	light15Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light15Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light15Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light15NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light15Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light15Diffuse = (light15Color.rgb * light15Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light15Ambient = light15AmbientColor.rgb * light15AmbientColor.a;

	// calculate attenuation
	float light15Attenuation = clamp( 1.0 - ( light15Falloff.x + (light15Falloff.y*D*D) + (light15Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light15colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light15Intensity = light15Ambient + light15Diffuse * light15Attenuation;
	vec3 light15FinalColor = light15DiffuseColor.rgb * light15Intensity;
	gl_FragColor =  (light15colors * vec4(light15FinalColor, light15DiffuseColor.a) * front.a );

  Sum += light15FinalColor * light15State01;
	}
}

// *************************************************************************************************************
// Start - light16 *********************************************************************************************
// *************************************************************************************************************

{
	if (light16State01 != 0.0){
	// Light 16 Constants
	vec3 light16Pos;
	vec4 light16Color = vec4(light16ColorR,light16ColorG,light16ColorB,light16Luminosity);
	vec4 light16AmbientColor = vec4(light16AmbientR,light16AmbientG,light16AmbientB,light16AmbientLuminosity);
	vec3 light16Falloff = vec3(light16Falloffv1,light16Falloffv2,light16Falloffv3);

	// Delta position of Light
	light16Pos.x = light16PosX;
	light16Pos.y = light16PosY;
	light16Pos.y = 1.0 - light16Pos.y;
	light16Pos.z = light16PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light16Dir = vec3(light16Pos.xy - (gl_FragCoord.xy / Resolution.xy), light16Pos.z);

	// Correct for aspect ratio
	light16Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light16Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light16Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light16NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light16Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light16Diffuse = (light16Color.rgb * light16Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light16Ambient = light16AmbientColor.rgb * light16AmbientColor.a;

	// calculate attenuation
	float light16Attenuation = clamp( 1.0 - ( light16Falloff.x + (light16Falloff.y*D*D) + (light16Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light16colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light16Intensity = light16Ambient + light16Diffuse * light16Attenuation;
	vec3 light16FinalColor = light16DiffuseColor.rgb * light16Intensity;
	gl_FragColor =  (light16colors * vec4(light16FinalColor, light16DiffuseColor.a) * front.a );

  Sum += light16FinalColor * light16State01;
	}
}

// *************************************************************************************************************
// Start - light17 *********************************************************************************************
// *************************************************************************************************************

{
	if (light17State01 != 0.0){
	// Light 17 Constants
	vec3 light17Pos;
	vec4 light17Color = vec4(light17ColorR,light17ColorG,light17ColorB,light17Luminosity);
	vec4 light17AmbientColor = vec4(light17AmbientR,light17AmbientG,light17AmbientB,light17AmbientLuminosity);
	vec3 light17Falloff = vec3(light17Falloffv1,light17Falloffv2,light17Falloffv3);

	// Delta position of Light
	light17Pos.x = light17PosX;
	light17Pos.y = light17PosY;
	light17Pos.y = 1.0 - light17Pos.y;
	light17Pos.z = light17PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light17Dir = vec3(light17Pos.xy - (gl_FragCoord.xy / Resolution.xy), light17Pos.z);

	// Correct for aspect ratio
	light17Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light17Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light17Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light17NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light17Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light17Diffuse = (light17Color.rgb * light17Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light17Ambient = light17AmbientColor.rgb * light17AmbientColor.a;

	// calculate attenuation
	float light17Attenuation = clamp( 1.0 - ( light17Falloff.x + (light17Falloff.y*D*D) + (light17Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light17colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light17Intensity = light17Ambient + light17Diffuse * light17Attenuation;
	vec3 light17FinalColor = light17DiffuseColor.rgb * light17Intensity;
	gl_FragColor =  (light17colors * vec4(light17FinalColor, light17DiffuseColor.a) * front.a );

  Sum += light17FinalColor * light17State01;
	}
}

// *************************************************************************************************************
// Start - light18 *********************************************************************************************
// *************************************************************************************************************

{
	if (light18State01 != 0.0){
	// Light 18 Constants
	vec3 light18Pos;
	vec4 light18Color = vec4(light18ColorR,light18ColorG,light18ColorB,light18Luminosity);
	vec4 light18AmbientColor = vec4(light18AmbientR,light18AmbientG,light18AmbientB,light18AmbientLuminosity);
	vec3 light18Falloff = vec3(light18Falloffv1,light18Falloffv2,light18Falloffv3);

	// Delta position of Light
	light18Pos.x = light18PosX;
	light18Pos.y = light18PosY;
	light18Pos.y = 1.0 - light18Pos.y;
	light18Pos.z = light18PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light18Dir = vec3(light18Pos.xy - (gl_FragCoord.xy / Resolution.xy), light18Pos.z);

	// Correct for aspect ratio
	light18Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light18Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light18Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light18NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light18Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light18Diffuse = (light18Color.rgb * light18Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light18Ambient = light18AmbientColor.rgb * light18AmbientColor.a;

	// calculate attenuation
	float light18Attenuation = clamp( 1.0 - ( light18Falloff.x + (light18Falloff.y*D*D) + (light18Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light18colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light18Intensity = light18Ambient + light18Diffuse * light18Attenuation;
	vec3 light18FinalColor = light18DiffuseColor.rgb * light18Intensity;
	gl_FragColor =  (light18colors * vec4(light18FinalColor, light18DiffuseColor.a) * front.a );

  Sum += light18FinalColor * light18State01;
	}
}

// *************************************************************************************************************
// Start - light19 *********************************************************************************************
// *************************************************************************************************************

{
	if (light19State01 != 0.0){
	// Light 19 Constants
	vec3 light19Pos;
	vec4 light19Color = vec4(light19ColorR,light19ColorG,light19ColorB,light19Luminosity);
	vec4 light19AmbientColor = vec4(light19AmbientR,light19AmbientG,light19AmbientB,light19AmbientLuminosity);
	vec3 light19Falloff = vec3(light19Falloffv1,light19Falloffv2,light19Falloffv3);

	// Delta position of Light
	light19Pos.x = light19PosX;
	light19Pos.y = light19PosY;
	light19Pos.y = 1.0 - light19Pos.y;
	light19Pos.z = light19PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light19Dir = vec3(light19Pos.xy - (gl_FragCoord.xy / Resolution.xy), light19Pos.z);

	// Correct for aspect ratio
	light19Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light19Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light19Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light19NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light19Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light19Diffuse = (light19Color.rgb * light19Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light19Ambient = light19AmbientColor.rgb * light19AmbientColor.a;

	// calculate attenuation
	float light19Attenuation = clamp( 1.0 - ( light19Falloff.x + (light19Falloff.y*D*D) + (light19Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light19colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light19Intensity = light19Ambient + light19Diffuse * light19Attenuation;
	vec3 light19FinalColor = light19DiffuseColor.rgb * light19Intensity;
	gl_FragColor =  (light19colors * vec4(light19FinalColor, light19DiffuseColor.a) * front.a );

  Sum += light19FinalColor * light19State01;
	}
}

// *************************************************************************************************************
// Start - light20 *********************************************************************************************
// *************************************************************************************************************

{
	if (light20State01 != 0.0){
	// Light 20 Constants
	vec3 light20Pos;
	vec4 light20Color = vec4(light20ColorR,light20ColorG,light20ColorB,light20Luminosity);
	vec4 light20AmbientColor = vec4(light20AmbientR,light20AmbientG,light20AmbientB,light20AmbientLuminosity);
	vec3 light20Falloff = vec3(light20Falloffv1,light20Falloffv2,light20Falloffv3);

	// Delta position of Light
	light20Pos.x = light20PosX;
	light20Pos.y = light20PosY;
	light20Pos.y = 1.0 - light20Pos.y;
	light20Pos.z = light20PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light20Dir = vec3(light20Pos.xy - (gl_FragCoord.xy / Resolution.xy), light20Pos.z);

	// Correct for aspect ratio
	light20Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light20Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light20Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light20NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light20Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light20Diffuse = (light20Color.rgb * light20Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light20Ambient = light20AmbientColor.rgb * light20AmbientColor.a;

	// calculate attenuation
	float light20Attenuation = clamp( 1.0 - ( light20Falloff.x + (light20Falloff.y*D*D) + (light20Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light20colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light20Intensity = light20Ambient + light20Diffuse * light20Attenuation;
	vec3 light20FinalColor = light20DiffuseColor.rgb * light20Intensity;
	gl_FragColor =  (light20colors * vec4(light20FinalColor, light20DiffuseColor.a) * front.a );

  Sum += light20FinalColor * light20State01;
	}
}

// *************************************************************************************************************
// Start - light21 *********************************************************************************************
// *************************************************************************************************************

{
	if (light21State01 != 0.0){
	// Light 21 Constants
	vec3 light21Pos;
	vec4 light21Color = vec4(light21ColorR,light21ColorG,light21ColorB,light21Luminosity);
	vec4 light21AmbientColor = vec4(light21AmbientR,light21AmbientG,light21AmbientB,light21AmbientLuminosity);
	vec3 light21Falloff = vec3(light21Falloffv1,light21Falloffv2,light21Falloffv3);

	// Delta position of Light
	light21Pos.x = light21PosX;
	light21Pos.y = light21PosY;
	light21Pos.y = 1.0 - light21Pos.y;
	light21Pos.z = light21PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light21Dir = vec3(light21Pos.xy - (gl_FragCoord.xy / Resolution.xy), light21Pos.z);

	// Correct for aspect ratio
	light21Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light21Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light21Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light21NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light21Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light21Diffuse = (light21Color.rgb * light21Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light21Ambient = light21AmbientColor.rgb * light21AmbientColor.a;

	// calculate attenuation
	float light21Attenuation = clamp( 1.0 - ( light21Falloff.x + (light21Falloff.y*D*D) + (light21Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light21colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light21Intensity = light21Ambient + light21Diffuse * light21Attenuation;
	vec3 light21FinalColor = light21DiffuseColor.rgb * light21Intensity;
	gl_FragColor =  (light21colors * vec4(light21FinalColor, light21DiffuseColor.a) * front.a );

  Sum += light21FinalColor * light21State01;
	}
}

// *************************************************************************************************************
// Start - light22 *********************************************************************************************
// *************************************************************************************************************

{
	if (light22State01 != 0.0){
	// Light 22 Constants
	vec3 light22Pos;
	vec4 light22Color = vec4(light22ColorR,light22ColorG,light22ColorB,light22Luminosity);
	vec4 light22AmbientColor = vec4(light22AmbientR,light22AmbientG,light22AmbientB,light22AmbientLuminosity);
	vec3 light22Falloff = vec3(light22Falloffv1,light22Falloffv2,light22Falloffv3);

	// Delta position of Light
	light22Pos.x = light22PosX;
	light22Pos.y = light22PosY;
	light22Pos.y = 1.0 - light22Pos.y;
	light22Pos.z = light22PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light22Dir = vec3(light22Pos.xy - (gl_FragCoord.xy / Resolution.xy), light22Pos.z);

	// Correct for aspect ratio
	light22Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light22Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light22Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light22NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light22Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light22Diffuse = (light22Color.rgb * light22Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light22Ambient = light22AmbientColor.rgb * light22AmbientColor.a;

	// calculate attenuation
	float light22Attenuation = clamp( 1.0 - ( light22Falloff.x + (light22Falloff.y*D*D) + (light22Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light22colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light22Intensity = light22Ambient + light22Diffuse * light22Attenuation;
	vec3 light22FinalColor = light22DiffuseColor.rgb * light22Intensity;
	gl_FragColor =  (light22colors * vec4(light22FinalColor, light22DiffuseColor.a) * front.a );

  Sum += light22FinalColor * light22State01;
	}
}

// *************************************************************************************************************
// Start - light23 *********************************************************************************************
// *************************************************************************************************************

{
	if (light23State01 != 0.0){
	// Light 23 Constants
	vec3 light23Pos;
	vec4 light23Color = vec4(light23ColorR,light23ColorG,light23ColorB,light23Luminosity);
	vec4 light23AmbientColor = vec4(light23AmbientR,light23AmbientG,light23AmbientB,light23AmbientLuminosity);
	vec3 light23Falloff = vec3(light23Falloffv1,light23Falloffv2,light23Falloffv3);

	// Delta position of Light
	light23Pos.x = light23PosX;
	light23Pos.y = light23PosY;
	light23Pos.y = 1.0 - light23Pos.y;
	light23Pos.z = light23PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light23Dir = vec3(light23Pos.xy - (gl_FragCoord.xy / Resolution.xy), light23Pos.z);

	// Correct for aspect ratio
	light23Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light23Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light23Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light23NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light23Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light23Diffuse = (light23Color.rgb * light23Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light23Ambient = light23AmbientColor.rgb * light23AmbientColor.a;

	// calculate attenuation
	float light23Attenuation = clamp( 1.0 - ( light23Falloff.x + (light23Falloff.y*D*D) + (light23Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light23colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light23Intensity = light23Ambient + light23Diffuse * light23Attenuation;
	vec3 light23FinalColor = light23DiffuseColor.rgb * light23Intensity;
	gl_FragColor =  (light23colors * vec4(light23FinalColor, light23DiffuseColor.a) * front.a );

  Sum += light23FinalColor * light23State01;
	}
}

// *************************************************************************************************************
// Start - light24 *********************************************************************************************
// *************************************************************************************************************

{
	if (light24State01 != 0.0){
	// Light 24 Constants
	vec3 light24Pos;
	vec4 light24Color = vec4(light24ColorR,light24ColorG,light24ColorB,light24Luminosity);
	vec4 light24AmbientColor = vec4(light24AmbientR,light24AmbientG,light24AmbientB,light24AmbientLuminosity);
	vec3 light24Falloff = vec3(light24Falloffv1,light24Falloffv2,light24Falloffv3);

	// Delta position of Light
	light24Pos.x = light24PosX;
	light24Pos.y = light24PosY;
	light24Pos.y = 1.0 - light24Pos.y;
	light24Pos.z = light24PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light24Dir = vec3(light24Pos.xy - (gl_FragCoord.xy / Resolution.xy), light24Pos.z);

	// Correct for aspect ratio
	light24Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light24Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light24Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light24NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light24Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light24Diffuse = (light24Color.rgb * light24Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light24Ambient = light24AmbientColor.rgb * light24AmbientColor.a;

	// calculate attenuation
	float light24Attenuation = clamp( 1.0 - ( light24Falloff.x + (light24Falloff.y*D*D) + (light24Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light24colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light24Intensity = light24Ambient + light24Diffuse * light24Attenuation;
	vec3 light24FinalColor = light24DiffuseColor.rgb * light24Intensity;
	gl_FragColor =  (light24colors * vec4(light24FinalColor, light24DiffuseColor.a) * front.a );

  Sum += light24FinalColor * light24State01;
	}
}

// *************************************************************************************************************
// Start - light25 *********************************************************************************************
// *************************************************************************************************************

{
	if (light25State01 != 0.0){
	// Light 25 Constants
	vec3 light25Pos;
	vec4 light25Color = vec4(light25ColorR,light25ColorG,light25ColorB,light25Luminosity);
	vec4 light25AmbientColor = vec4(light25AmbientR,light25AmbientG,light25AmbientB,light25AmbientLuminosity);
	vec3 light25Falloff = vec3(light25Falloffv1,light25Falloffv2,light25Falloffv3);

	// Delta position of Light
	light25Pos.x = light25PosX;
	light25Pos.y = light25PosY;
	light25Pos.y = 1.0 - light25Pos.y;
	light25Pos.z = light25PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light25Dir = vec3(light25Pos.xy - (gl_FragCoord.xy / Resolution.xy), light25Pos.z);

	// Correct for aspect ratio
	light25Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light25Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light25Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light25NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light25Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light25Diffuse = (light25Color.rgb * light25Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light25Ambient = light25AmbientColor.rgb * light25AmbientColor.a;

	// calculate attenuation
	float light25Attenuation = clamp( 1.0 - ( light25Falloff.x + (light25Falloff.y*D*D) + (light25Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light25colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light25Intensity = light25Ambient + light25Diffuse * light25Attenuation;
	vec3 light25FinalColor = light25DiffuseColor.rgb * light25Intensity;
	gl_FragColor =  (light25colors * vec4(light25FinalColor, light25DiffuseColor.a) * front.a );

  Sum += light25FinalColor * light25State01;
	}
}

// *************************************************************************************************************
// Start - light26 *********************************************************************************************
// *************************************************************************************************************

{
	if (light26State01 != 0.0){
	// Light 26 Constants
	vec3 light26Pos;
	vec4 light26Color = vec4(light26ColorR,light26ColorG,light26ColorB,light26Luminosity);
	vec4 light26AmbientColor = vec4(light26AmbientR,light26AmbientG,light26AmbientB,light26AmbientLuminosity);
	vec3 light26Falloff = vec3(light26Falloffv1,light26Falloffv2,light26Falloffv3);

	// Delta position of Light
	light26Pos.x = light26PosX;
	light26Pos.y = light26PosY;
	light26Pos.y = 1.0 - light26Pos.y;
	light26Pos.z = light26PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light26Dir = vec3(light26Pos.xy - (gl_FragCoord.xy / Resolution.xy), light26Pos.z);

	// Correct for aspect ratio
	light26Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light26Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light26Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light26NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light26Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light26Diffuse = (light26Color.rgb * light26Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light26Ambient = light26AmbientColor.rgb * light26AmbientColor.a;

	// calculate attenuation
	float light26Attenuation = clamp( 1.0 - ( light26Falloff.x + (light26Falloff.y*D*D) + (light26Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light26colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light26Intensity = light26Ambient + light26Diffuse * light26Attenuation;
	vec3 light26FinalColor = light26DiffuseColor.rgb * light26Intensity;
	gl_FragColor =  (light26colors * vec4(light26FinalColor, light26DiffuseColor.a) * front.a );

  Sum += light26FinalColor * light26State01;
	}
}

// *************************************************************************************************************
// Start - light27 *********************************************************************************************
// *************************************************************************************************************

{
	if (light27State01 != 0.0){
	// Light 27 Constants
	vec3 light27Pos;
	vec4 light27Color = vec4(light27ColorR,light27ColorG,light27ColorB,light27Luminosity);
	vec4 light27AmbientColor = vec4(light27AmbientR,light27AmbientG,light27AmbientB,light27AmbientLuminosity);
	vec3 light27Falloff = vec3(light27Falloffv1,light27Falloffv2,light27Falloffv3);

	// Delta position of Light
	light27Pos.x = light27PosX;
	light27Pos.y = light27PosY;
	light27Pos.y = 1.0 - light27Pos.y;
	light27Pos.z = light27PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light27Dir = vec3(light27Pos.xy - (gl_FragCoord.xy / Resolution.xy), light27Pos.z);

	// Correct for aspect ratio
	light27Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light27Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light27Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light27NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light27Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light27Diffuse = (light27Color.rgb * light27Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light27Ambient = light27AmbientColor.rgb * light27AmbientColor.a;

	// calculate attenuation
	float light27Attenuation = clamp( 1.0 - ( light27Falloff.x + (light27Falloff.y*D*D) + (light27Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light27colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light27Intensity = light27Ambient + light27Diffuse * light27Attenuation;
	vec3 light27FinalColor = light27DiffuseColor.rgb * light27Intensity;
	gl_FragColor =  (light27colors * vec4(light27FinalColor, light27DiffuseColor.a) * front.a );

  Sum += light27FinalColor * light27State01;
	}
}

// *************************************************************************************************************
// Start - light28 *********************************************************************************************
// *************************************************************************************************************

{
	if (light28State01 != 0.0){
	// Light 28 Constants
	vec3 light28Pos;
	vec4 light28Color = vec4(light28ColorR,light28ColorG,light28ColorB,light28Luminosity);
	vec4 light28AmbientColor = vec4(light28AmbientR,light28AmbientG,light28AmbientB,light28AmbientLuminosity);
	vec3 light28Falloff = vec3(light28Falloffv1,light28Falloffv2,light28Falloffv3);

	// Delta position of Light
	light28Pos.x = light28PosX;
	light28Pos.y = light28PosY;
	light28Pos.y = 1.0 - light28Pos.y;
	light28Pos.z = light28PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light28Dir = vec3(light28Pos.xy - (gl_FragCoord.xy / Resolution.xy), light28Pos.z);

	// Correct for aspect ratio
	light28Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light28Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light28Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light28NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light28Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light28Diffuse = (light28Color.rgb * light28Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light28Ambient = light28AmbientColor.rgb * light28AmbientColor.a;

	// calculate attenuation
	float light28Attenuation = clamp( 1.0 - ( light28Falloff.x + (light28Falloff.y*D*D) + (light28Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light28colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light28Intensity = light28Ambient + light28Diffuse * light28Attenuation;
	vec3 light28FinalColor = light28DiffuseColor.rgb * light28Intensity;
	gl_FragColor =  (light28colors * vec4(light28FinalColor, light28DiffuseColor.a) * front.a );

  Sum += light28FinalColor * light28State01;
	}
}

// *************************************************************************************************************
// Start - light29 *********************************************************************************************
// *************************************************************************************************************

{
	if (light29State01 != 0.0){
	// Light 29 Constants
	vec3 light29Pos;
	vec4 light29Color = vec4(light29ColorR,light29ColorG,light29ColorB,light29Luminosity);
	vec4 light29AmbientColor = vec4(light29AmbientR,light29AmbientG,light29AmbientB,light29AmbientLuminosity);
	vec3 light29Falloff = vec3(light29Falloffv1,light29Falloffv2,light29Falloffv3);

	// Delta position of Light
	light29Pos.x = light29PosX;
	light29Pos.y = light29PosY;
	light29Pos.y = 1.0 - light29Pos.y;
	light29Pos.z = light29PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light29Dir = vec3(light29Pos.xy - (gl_FragCoord.xy / Resolution.xy), light29Pos.z);

	// Correct for aspect ratio
	light29Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light29Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light29Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light29NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light29Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light29Diffuse = (light29Color.rgb * light29Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light29Ambient = light29AmbientColor.rgb * light29AmbientColor.a;

	// calculate attenuation
	float light29Attenuation = clamp( 1.0 - ( light29Falloff.x + (light29Falloff.y*D*D) + (light29Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light29colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light29Intensity = light29Ambient + light29Diffuse * light29Attenuation;
	vec3 light29FinalColor = light29DiffuseColor.rgb * light29Intensity;
	gl_FragColor =  (light29colors * vec4(light29FinalColor, light29DiffuseColor.a) * front.a );

  Sum += light29FinalColor * light29State01;
	}
}

// *************************************************************************************************************
// Start - light30 *********************************************************************************************
// *************************************************************************************************************

{
	if (light30State01 != 0.0){
	// Light 30 Constants
	vec3 light30Pos;
	vec4 light30Color = vec4(light30ColorR,light30ColorG,light30ColorB,light30Luminosity);
	vec4 light30AmbientColor = vec4(light30AmbientR,light30AmbientG,light30AmbientB,light30AmbientLuminosity);
	vec3 light30Falloff = vec3(light30Falloffv1,light30Falloffv2,light30Falloffv3);

	// Delta position of Light
	light30Pos.x = light30PosX;
	light30Pos.y = light30PosY;
	light30Pos.y = 1.0 - light30Pos.y;
	light30Pos.z = light30PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light30Dir = vec3(light30Pos.xy - (gl_FragCoord.xy / Resolution.xy), light30Pos.z);

	// Correct for aspect ratio
	light30Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light30Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light30Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light30NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light30Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light30Diffuse = (light30Color.rgb * light30Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light30Ambient = light30AmbientColor.rgb * light30AmbientColor.a;

	// calculate attenuation
	float light30Attenuation = clamp( 1.0 - ( light30Falloff.x + (light30Falloff.y*D*D) + (light30Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light30colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light30Intensity = light30Ambient + light30Diffuse * light30Attenuation;
	vec3 light30FinalColor = light30DiffuseColor.rgb * light30Intensity;
	gl_FragColor =  (light30colors * vec4(light30FinalColor, light30DiffuseColor.a) * front.a );

  Sum += light30FinalColor * light30State01;
	}
}

// *************************************************************************************************************
// Start - light31 *********************************************************************************************
// *************************************************************************************************************

{
	if (light31State01 != 0.0){
	// Light 31 Constants
	vec3 light31Pos;
	vec4 light31Color = vec4(light31ColorR,light31ColorG,light31ColorB,light31Luminosity);
	vec4 light31AmbientColor = vec4(light31AmbientR,light31AmbientG,light31AmbientB,light31AmbientLuminosity);
	vec3 light31Falloff = vec3(light31Falloffv1,light31Falloffv2,light31Falloffv3);

	// Delta position of Light
	light31Pos.x = light31PosX;
	light31Pos.y = light31PosY;
	light31Pos.y = 1.0 - light31Pos.y;
	light31Pos.z = light31PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light31Dir = vec3(light31Pos.xy - (gl_FragCoord.xy / Resolution.xy), light31Pos.z);

	// Correct for aspect ratio
	light31Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light31Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light31Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light31NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light31Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light31Diffuse = (light31Color.rgb * light31Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light31Ambient = light31AmbientColor.rgb * light31AmbientColor.a;

	// calculate attenuation
	float light31Attenuation = clamp( 1.0 - ( light31Falloff.x + (light31Falloff.y*D*D) + (light31Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light31colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light31Intensity = light31Ambient + light31Diffuse * light31Attenuation;
	vec3 light31FinalColor = light31DiffuseColor.rgb * light31Intensity;
	gl_FragColor =  (light31colors * vec4(light31FinalColor, light31DiffuseColor.a) * front.a );

  Sum += light31FinalColor * light31State01;
	}
}

// *************************************************************************************************************
// Start - light32 *********************************************************************************************
// *************************************************************************************************************

{
	if (light32State01 != 0.0){
	// Light 32 Constants
	vec3 light32Pos;
	vec4 light32Color = vec4(light32ColorR,light32ColorG,light32ColorB,light32Luminosity);
	vec4 light32AmbientColor = vec4(light32AmbientR,light32AmbientG,light32AmbientB,light32AmbientLuminosity);
	vec3 light32Falloff = vec3(light32Falloffv1,light32Falloffv2,light32Falloffv3);

	// Delta position of Light
	light32Pos.x = light32PosX;
	light32Pos.y = light32PosY;
	light32Pos.y = 1.0 - light32Pos.y;
	light32Pos.z = light32PosZ;
	Resolution.x = screenXResolution;
	Resolution.y = screenYResolution;
	vec3 light32Dir = vec3(light32Pos.xy - (gl_FragCoord.xy / Resolution.xy), light32Pos.z);

	// Correct for aspect ratio
	light32Dir.x *= Resolution.x / Resolution.y;

	// Determine distance (used for attenuation) BEFORE we normalize our LightDir
	float D = length(light32Dir);

	// Hard limit for NormalMap, beyond this distance, go dark
	D = (D < light32Distance) ? D : 1000.0;

	// normalize our vectors
	vec3 N = normalize(light32NormalMap * 2.0 - 1.0);
	vec3 L = normalize(light32Dir);

	// Pre-multiply light color with intensity
	// Then perform "N dot L" to determine our diffuse term
	vec3 light32Diffuse = (light32Color.rgb * light32Color.a) * max(dot(N, L), 0.0);

	// pre-multiply ambient color with intensity
	vec3 light32Ambient = light32AmbientColor.rgb * light32AmbientColor.a;

	// calculate attenuation
	float light32Attenuation = clamp( 1.0 - ( light32Falloff.x + (light32Falloff.y*D*D) + (light32Falloff.z*D*D*D*D*D) ),0.0,1.0);
	vec4 light32colors = vec4(1.0,1.0,1.0,1.0);

	// the calculation which brings it all together
	vec3 light32Intensity = light32Ambient + light32Diffuse * light32Attenuation;
	vec3 light32FinalColor = light32DiffuseColor.rgb * light32Intensity;
	gl_FragColor =  (light32colors * vec4(light32FinalColor, light32DiffuseColor.a) * front.a );

  Sum += light32FinalColor * light32State01;
	}
}

// *************************************************************************************************************
// SHADER OUTPUT ***********************************************************************************************
// *************************************************************************************************************
	// Multiple Lights
	gl_FragColor = (vec4(Sum, DiffuseColor.a)) * front.a;
	// "* front.a" at the end to use NormalMaps with alpha and avoid some glitches

}
