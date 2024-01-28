#version 300 es
precision highp float;

uniform float normalScaleX;
uniform float normalScaleY;
uniform float normalAngle;
uniform float lightMaxID;
uniform lowp vec3 ambientColor;
uniform float ambientIntensity;
uniform float light1Intensity;
uniform float light1PosX;
uniform float light1PosY;
uniform float light1PosZ;
uniform lowp vec3 light1Color;
uniform float light1Clamp;
uniform float light1LinearFalloff;
uniform float light1QuadraticFalloff;
uniform float light2Intensity;
uniform float light2PosX;
uniform float light2PosY;
uniform float light2PosZ;
uniform lowp vec3 light2Color;
uniform float light2Clamp;
uniform float light2LinearFalloff;
uniform float light2QuadraticFalloff;
uniform float light3Intensity;
uniform float light3PosX;
uniform float light3PosY;
uniform float light3PosZ;
uniform lowp vec3 light3Color;
uniform float light3Clamp;
uniform float light3LinearFalloff;
uniform float light3QuadraticFalloff;
uniform float light4Intensity;
uniform float light4PosX;
uniform float light4PosY;
uniform float light4PosZ;
uniform lowp vec3 light4Color;
uniform float light4Clamp;
uniform float light4LinearFalloff;
uniform float light4QuadraticFalloff;
uniform float light5Intensity;
uniform float light5PosX;
uniform float light5PosY;
uniform float light5PosZ;
uniform lowp vec3 light5Color;
uniform float light5Clamp;
uniform float light5LinearFalloff;
uniform float light5QuadraticFalloff;
uniform float light6Intensity;
uniform float light6PosX;
uniform float light6PosY;
uniform float light6PosZ;
uniform lowp vec3 light6Color;
uniform float light6Clamp;
uniform float light6LinearFalloff;
uniform float light6QuadraticFalloff;
uniform float light7Intensity;
uniform float light7PosX;
uniform float light7PosY;
uniform float light7PosZ;
uniform lowp vec3 light7Color;
uniform float light7Clamp;
uniform float light7LinearFalloff;
uniform float light7QuadraticFalloff;
uniform float light8Intensity;
uniform float light8PosX;
uniform float light8PosY;
uniform float light8PosZ;
uniform lowp vec3 light8Color;
uniform float light8Clamp;
uniform float light8LinearFalloff;
uniform float light8QuadraticFalloff;
uniform float light9Intensity;
uniform float light9PosX;
uniform float light9PosY;
uniform float light9PosZ;
uniform lowp vec3 light9Color;
uniform float light9Clamp;
uniform float light9LinearFalloff;
uniform float light9QuadraticFalloff;
uniform float light10Intensity;
uniform float light10PosX;
uniform float light10PosY;
uniform float light10PosZ;
uniform lowp vec3 light10Color;
uniform float light10Clamp;
uniform float light10LinearFalloff;
uniform float light10QuadraticFalloff;
uniform float light11Intensity;
uniform float light11PosX;
uniform float light11PosY;
uniform float light11PosZ;
uniform lowp vec3 light11Color;
uniform float light11Clamp;
uniform float light11LinearFalloff;
uniform float light11QuadraticFalloff;
uniform float light12Intensity;
uniform float light12PosX;
uniform float light12PosY;
uniform float light12PosZ;
uniform lowp vec3 light12Color;
uniform float light12Clamp;
uniform float light12LinearFalloff;
uniform float light12QuadraticFalloff;
uniform float light13Intensity;
uniform float light13PosX;
uniform float light13PosY;
uniform float light13PosZ;
uniform lowp vec3 light13Color;
uniform float light13Clamp;
uniform float light13LinearFalloff;
uniform float light13QuadraticFalloff;
uniform float light14Intensity;
uniform float light14PosX;
uniform float light14PosY;
uniform float light14PosZ;
uniform lowp vec3 light14Color;
uniform float light14Clamp;
uniform float light14LinearFalloff;
uniform float light14QuadraticFalloff;
uniform float light15Intensity;
uniform float light15PosX;
uniform float light15PosY;
uniform float light15PosZ;
uniform lowp vec3 light15Color;
uniform float light15Clamp;
uniform float light15LinearFalloff;
uniform float light15QuadraticFalloff;
uniform float light16Intensity;
uniform float light16PosX;
uniform float light16PosY;
uniform float light16PosZ;
uniform lowp vec3 light16Color;
uniform float light16Clamp;
uniform float light16LinearFalloff;
uniform float light16QuadraticFalloff;
uniform float light17Intensity;
uniform float light17PosX;
uniform float light17PosY;
uniform float light17PosZ;
uniform lowp vec3 light17Color;
uniform float light17Clamp;
uniform float light17LinearFalloff;
uniform float light17QuadraticFalloff;
uniform float light18Intensity;
uniform float light18PosX;
uniform float light18PosY;
uniform float light18PosZ;
uniform lowp vec3 light18Color;
uniform float light18Clamp;
uniform float light18LinearFalloff;
uniform float light18QuadraticFalloff;
uniform float light19Intensity;
uniform float light19PosX;
uniform float light19PosY;
uniform float light19PosZ;
uniform lowp vec3 light19Color;
uniform float light19Clamp;
uniform float light19LinearFalloff;
uniform float light19QuadraticFalloff;
uniform float light20Intensity;
uniform float light20PosX;
uniform float light20PosY;
uniform float light20PosZ;
uniform lowp vec3 light20Color;
uniform float light20Clamp;
uniform float light20LinearFalloff;
uniform float light20QuadraticFalloff;
uniform float light21Intensity;
uniform float light21PosX;
uniform float light21PosY;
uniform float light21PosZ;
uniform lowp vec3 light21Color;
uniform float light21Clamp;
uniform float light21LinearFalloff;
uniform float light21QuadraticFalloff;
uniform float light22Intensity;
uniform float light22PosX;
uniform float light22PosY;
uniform float light22PosZ;
uniform lowp vec3 light22Color;
uniform float light22Clamp;
uniform float light22LinearFalloff;
uniform float light22QuadraticFalloff;
uniform float light23Intensity;
uniform float light23PosX;
uniform float light23PosY;
uniform float light23PosZ;
uniform lowp vec3 light23Color;
uniform float light23Clamp;
uniform float light23LinearFalloff;
uniform float light23QuadraticFalloff;
uniform float light24Intensity;
uniform float light24PosX;
uniform float light24PosY;
uniform float light24PosZ;
uniform lowp vec3 light24Color;
uniform float light24Clamp;
uniform float light24LinearFalloff;
uniform float light24QuadraticFalloff;
uniform float light25Intensity;
uniform float light25PosX;
uniform float light25PosY;
uniform float light25PosZ;
uniform lowp vec3 light25Color;
uniform float light25Clamp;
uniform float light25LinearFalloff;
uniform float light25QuadraticFalloff;
uniform float light26Intensity;
uniform float light26PosX;
uniform float light26PosY;
uniform float light26PosZ;
uniform lowp vec3 light26Color;
uniform float light26Clamp;
uniform float light26LinearFalloff;
uniform float light26QuadraticFalloff;
uniform float light27Intensity;
uniform float light27PosX;
uniform float light27PosY;
uniform float light27PosZ;
uniform lowp vec3 light27Color;
uniform float light27Clamp;
uniform float light27LinearFalloff;
uniform float light27QuadraticFalloff;
uniform float light28Intensity;
uniform float light28PosX;
uniform float light28PosY;
uniform float light28PosZ;
uniform lowp vec3 light28Color;
uniform float light28Clamp;
uniform float light28LinearFalloff;
uniform float light28QuadraticFalloff;
uniform float light29Intensity;
uniform float light29PosX;
uniform float light29PosY;
uniform float light29PosZ;
uniform lowp vec3 light29Color;
uniform float light29Clamp;
uniform float light29LinearFalloff;
uniform float light29QuadraticFalloff;
uniform float light30Intensity;
uniform float light30PosX;
uniform float light30PosY;
uniform float light30PosZ;
uniform lowp vec3 light30Color;
uniform float light30Clamp;
uniform float light30LinearFalloff;
uniform float light30QuadraticFalloff;
uniform float light31Intensity;
uniform float light31PosX;
uniform float light31PosY;
uniform float light31PosZ;
uniform lowp vec3 light31Color;
uniform float light31Clamp;
uniform float light31LinearFalloff;
uniform float light31QuadraticFalloff;
uniform float light32Intensity;
uniform float light32PosX;
uniform float light32PosY;
uniform float light32PosZ;
uniform lowp vec3 light32Color;
uniform float light32Clamp;
uniform float light32LinearFalloff;
uniform float light32QuadraticFalloff;

in mediump vec2 vTex;
uniform lowp sampler2D samplerBack;
uniform lowp sampler2D samplerFront;
uniform mediump vec2 srcStart;
uniform mediump vec2 srcEnd;
uniform mediump vec2 destStart;
uniform mediump vec2 destEnd;
uniform mediump float devicePixelRatio;
out vec4 outColor;

#define PI180 0.01745329

vec2 rotate(vec2 v, float a) {
    float s = sin(a);
    float c = cos(a);
    mat2 m = mat2(c, s, -s, c);
    return m * v;
}

void main(void) {

	float lightIntensity[32] = float[](
		light1Intensity,
		light2Intensity,
		light3Intensity,
		light4Intensity,
		light5Intensity,
		light6Intensity,
		light7Intensity,
		light8Intensity,
		light9Intensity,
		light10Intensity,
		light11Intensity,
		light12Intensity,
		light13Intensity,
		light14Intensity,
		light15Intensity,
		light16Intensity,
		light17Intensity,
		light18Intensity,
		light19Intensity,
		light20Intensity,
		light21Intensity,
		light22Intensity,
		light23Intensity,
		light24Intensity,
		light25Intensity,
		light26Intensity,
		light27Intensity,
		light28Intensity,
		light29Intensity,
		light30Intensity,
		light31Intensity,
		light32Intensity
	);

	float lightClamp[32] = float[](
		light1Clamp * 10.0,
		light2Clamp * 10.0,
		light3Clamp * 10.0,
		light4Clamp * 10.0,
		light5Clamp * 10.0,
		light6Clamp * 10.0,
		light7Clamp * 10.0,
		light8Clamp * 10.0,
		light9Clamp * 10.0,
		light10Clamp * 10.0,
		light11Clamp * 10.0,
		light12Clamp * 10.0,
		light13Clamp * 10.0,
		light14Clamp * 10.0,
		light15Clamp * 10.0,
		light16Clamp * 10.0,
		light17Clamp * 10.0,
		light18Clamp * 10.0,
		light19Clamp * 10.0,
		light20Clamp * 10.0,
		light21Clamp * 10.0,
		light22Clamp * 10.0,
		light23Clamp * 10.0,
		light24Clamp * 10.0,
		light25Clamp * 10.0,
		light26Clamp * 10.0,
		light27Clamp * 10.0,
		light28Clamp * 10.0,
		light29Clamp * 10.0,
		light30Clamp * 10.0,
		light31Clamp * 10.0,
		light32Clamp * 10.0
	);

	vec3 lightPos[32] = vec3[] (
		vec3(light1PosX, 1.0 - light1PosY, light1PosZ),
		vec3(light2PosX, 1.0 - light2PosY, light2PosZ),
		vec3(light3PosX, 1.0 - light3PosY, light3PosZ),
		vec3(light4PosX, 1.0 - light4PosY, light4PosZ),
		vec3(light5PosX, 1.0 - light5PosY, light5PosZ),
		vec3(light6PosX, 1.0 - light6PosY, light6PosZ),
		vec3(light7PosX, 1.0 - light7PosY, light7PosZ),
		vec3(light8PosX, 1.0 - light8PosY, light8PosZ),
		vec3(light9PosX, 1.0 - light9PosY, light9PosZ),
		vec3(light10PosX, 1.0 - light10PosY, light10PosZ),
		vec3(light11PosX, 1.0 - light11PosY, light11PosZ),
		vec3(light12PosX, 1.0 - light12PosY, light12PosZ),
		vec3(light13PosX, 1.0 - light13PosY, light13PosZ),
		vec3(light14PosX, 1.0 - light14PosY, light14PosZ),
		vec3(light15PosX, 1.0 - light15PosY, light15PosZ),
		vec3(light16PosX, 1.0 - light16PosY, light16PosZ),
		vec3(light17PosX, 1.0 - light17PosY, light17PosZ),
		vec3(light18PosX, 1.0 - light18PosY, light18PosZ),
		vec3(light19PosX, 1.0 - light19PosY, light19PosZ),
		vec3(light20PosX, 1.0 - light20PosY, light20PosZ),
		vec3(light21PosX, 1.0 - light21PosY, light21PosZ),
		vec3(light22PosX, 1.0 - light22PosY, light22PosZ),
		vec3(light23PosX, 1.0 - light23PosY, light23PosZ),
		vec3(light24PosX, 1.0 - light24PosY, light24PosZ),
		vec3(light25PosX, 1.0 - light25PosY, light25PosZ),
		vec3(light26PosX, 1.0 - light26PosY, light26PosZ),
		vec3(light27PosX, 1.0 - light27PosY, light27PosZ),
		vec3(light28PosX, 1.0 - light28PosY, light28PosZ),
		vec3(light29PosX, 1.0 - light29PosY, light29PosZ),
		vec3(light30PosX, 1.0 - light30PosY, light30PosZ),
		vec3(light31PosX, 1.0 - light31PosY, light31PosZ),
		vec3(light32PosX, 1.0 - light32PosY, light32PosZ)
	);

	vec3 lightColor[32] = vec3[] (
		vec3(light1Color),
		vec3(light2Color),
		vec3(light3Color),
		vec3(light4Color),
		vec3(light5Color),
		vec3(light6Color),
		vec3(light7Color),
		vec3(light8Color),
		vec3(light9Color),
		vec3(light10Color),
		vec3(light11Color),
		vec3(light12Color),
		vec3(light13Color),
		vec3(light14Color),
		vec3(light15Color),
		vec3(light16Color),
		vec3(light17Color),
		vec3(light18Color),
		vec3(light19Color),
		vec3(light20Color),
		vec3(light21Color),
		vec3(light22Color),
		vec3(light23Color),
		vec3(light24Color),
		vec3(light25Color),
		vec3(light26Color),
		vec3(light27Color),
		vec3(light28Color),
		vec3(light29Color),
		vec3(light30Color),
		vec3(light31Color),
		vec3(light32Color)
	);

	vec2 falloff[32] = vec2[] (
		vec2(light1LinearFalloff, light1QuadraticFalloff),
		vec2(light2LinearFalloff, light2QuadraticFalloff),
		vec2(light3LinearFalloff, light3QuadraticFalloff),
		vec2(light4LinearFalloff, light4QuadraticFalloff),
		vec2(light5LinearFalloff, light5QuadraticFalloff),
		vec2(light6LinearFalloff, light6QuadraticFalloff),
		vec2(light7LinearFalloff, light7QuadraticFalloff),
		vec2(light8LinearFalloff, light8QuadraticFalloff),
		vec2(light9LinearFalloff, light9QuadraticFalloff),
		vec2(light10LinearFalloff, light10QuadraticFalloff),
		vec2(light11LinearFalloff, light11QuadraticFalloff),
		vec2(light12LinearFalloff, light12QuadraticFalloff),
		vec2(light13LinearFalloff, light13QuadraticFalloff),
		vec2(light14LinearFalloff, light14QuadraticFalloff),
		vec2(light15LinearFalloff, light15QuadraticFalloff),
		vec2(light16LinearFalloff, light16QuadraticFalloff),
		vec2(light17LinearFalloff, light17QuadraticFalloff),
		vec2(light18LinearFalloff, light18QuadraticFalloff),
		vec2(light19LinearFalloff, light19QuadraticFalloff),
		vec2(light20LinearFalloff, light20QuadraticFalloff),
		vec2(light21LinearFalloff, light21QuadraticFalloff),
		vec2(light22LinearFalloff, light22QuadraticFalloff),
		vec2(light23LinearFalloff, light23QuadraticFalloff),
		vec2(light24LinearFalloff, light24QuadraticFalloff),
		vec2(light25LinearFalloff, light25QuadraticFalloff),
		vec2(light26LinearFalloff, light26QuadraticFalloff),
		vec2(light27LinearFalloff, light27QuadraticFalloff),
		vec2(light28LinearFalloff, light28QuadraticFalloff),
		vec2(light29LinearFalloff, light29QuadraticFalloff),
		vec2(light30LinearFalloff, light30QuadraticFalloff),
		vec2(light31LinearFalloff, light31QuadraticFalloff),
		vec2(light32LinearFalloff, light32QuadraticFalloff)
	);

	ivec2 texSize = textureSize(samplerBack, 0);
	lowp vec2 iResolution = vec2(float(texSize.x), float(texSize.y));
	iResolution = round(iResolution * devicePixelRatio);

	lowp vec4 front = texture(samplerFront, vTex);
	mediump vec2 tex = (vTex - srcStart) / (srcEnd - srcStart);
	lowp vec4 back = texture(samplerBack, mix(destStart, destEnd, tex));
	mediump vec3 normal = normalize(front.rgb * 2.0 - 1.0);

	normal.xy /= vec2(normalScaleX,normalScaleY);
	normal.xy = rotate(normal.xy, -normalAngle * PI180);

	int lightMax = int(clamp(lightMaxID, 0.0, 32.0));
	vec3 ambient = ambientColor * ambientIntensity * 2.0;
	vec3 sum = vec3(back.rgb * ambient);

	for (int i = 0; i < 32; i++) {
		if (i >= lightMax) break;
		if (lightIntensity[i] == 0.0) continue;
		vec3 lightDir = vec3(lightPos[i].xy - gl_FragCoord.xy / iResolution, lightPos[i].z);
		lightDir.x *= iResolution.x / iResolution.y;
		float D = length(lightDir);
		D = mix(D, 1000.0, step(lightClamp[i], D));
		vec3 L = normalize(lightDir);
		vec3 diffuse = lightColor[i] * lightIntensity[i] * max(dot(normal, L), 0.0);
		float attenuation = clamp(1.0 - (falloff[i].x*D + falloff[i].y*D*D),0.0,1.0);
		vec3 intensity = diffuse * attenuation;
		vec3 finalColor = back.rgb * intensity;
		sum += finalColor * lightIntensity[i];
	}
	outColor = vec4(sum, back.a) * front.a;
}