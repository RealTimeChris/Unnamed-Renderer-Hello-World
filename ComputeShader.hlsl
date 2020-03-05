// ComputeShader.hlsl - RGB Swirl Compute Shader.
// Mar 2020
// Chris M.
// https://github.com/RealTimeChris

struct RootConstants{
	float InitialRedCircleOriginX, InitialRedCircleOriginY;
	float InitialGreenCircleOriginX, InitialGreenCircleOriginY;
	float InitialBlueCircleOriginX, InitialBlueCircleOriginY;
	float MainCircleOriginX, MainCircleOriginY;
	float CircleRadii;
	int CurrentFinalFrameIndex;
	float GlobalTickInRadians;
	float Padding01;
};

ConstantBuffer<RootConstants> InlineRootConstants : register(b0);

RWTexture2D<unorm float4> RenderTarget : register(u0);

[numthreads(16, 12, 1)]
void ComputeMain(uint3 GlobalThreadId : SV_DispatchThreadID)
{	
	float RedChannel = InlineRootConstants.CircleRadii;
	float GreenChannel = InlineRootConstants.GlobalTickInRadians / 2.0f;
	float BlueChannel = InlineRootConstants.MainCircleOriginY;
	
	RenderTarget[GlobalThreadId.xy].x = 0.0f;
	RenderTarget[GlobalThreadId.xy].y = GreenChannel;
	RenderTarget[GlobalThreadId.xy].z = 0.0f;
}
