# NormalMap32 for Construct 3

![normalmap32](https://github.com/Everade/NormalMap32/assets/12261601/8f0d434d-0b15-41e5-a2c2-d50a7432062a)

This repository contains code for the [NormalMap32 Construct effect](https://www.construct.net/make-games/addons/898/normalmap32). NormalMap32 allows to create and control up to 32 colored point lights that interact with a 2D normal map texture. The result is a simulated 3D lighting effect. There are two main components in this repository:

- *construct-addon*: the Construct addon, written in GLSL using the [Construct Addon SDK](https://github.com/Scirra/Construct-Addon-SDK)
- *example-project*: the Construct example project, demonstrating some of the effect capabilities

## Distributing

The Construct plugin is distributed as a [.c3addon file](https://www.construct.net/en/make-games/manuals/addon-sdk/guide/c3addon-file), which is essentially a renamed zip file with the addon files.

> [!WARNING]
> If you want to modify the plugin for your own purposes, it is strongly advised to **change the Construct plugin ID.** This will avoid serious compatibility problems which could result in your project becoming unopenable.

## What is a Normal Map?

Normal mapping is a texture mapping technique used for faking the lighting of bumps and dents – an implementation of bump mapping. Each normal map pixel represents the direction in which the sprite's pixel is facing.

![normals60degreescropped](https://github.com/Everade/NormalMap32/assets/12261601/7f708429-d451-4abf-a192-e44298d647f5)

https://github.com/Everade/NormalMap32/assets/12261601/5e1581fb-cf97-445b-9075-a88f3becde71

## How does it work?

You have to create OpenGL/WebGL compatible normal map sprites for each 2D sprite you want to apply the effect onto. This normal map sprite is used as a foreground effect that needs to be placed on top of the original 2D sprite background.

You can create Normal Map sprites either automatically using Normal Map Generator software, or draw them by hand. The NormalMap32 effect needs to be applied to each normal map sprite you've imported into Construct 3. Light sources are then defined within the parameters of each normal map sprite effect.

Please note that a light source object is not a requirement, but it's a convenient way to create dynamic lights within your game, as shown in the fully documented example project.

## Performance Considerations

Applying the effect to lots of individual normal map sprites can be costly. Consider to either draw all normal sprites to a canvas or apply it to a layer instead. Set Max Light ID to the lowest possible value for enhanced shader performance.

## Features

- Supports WebGL1.
- Up to 32 simultaneous RGB light sources per normal map.
- Linear, quadratic or mixed light falloff.
- Distance clamping for spot light effects.
- Global ambient light (RGB).

## Credits

- [Normal Mapping - ShaderLesson6](https://github.com/mattdesl/lwjgl-basics/wiki/ShaderLesson6) by Matt DesLauriers
- [NormalMapExtended](https://www.construct.net/make-games/addons/194/normalmapextended) by donelwero, matriax, Mikal

## License

This code is published under the [MIT license](LICENSE).