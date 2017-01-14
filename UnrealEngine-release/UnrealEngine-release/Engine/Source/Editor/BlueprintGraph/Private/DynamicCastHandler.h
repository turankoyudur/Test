// Copyright 1998-2016 Epic Games, Inc. All Rights Reserved.

#pragma once

#include "KismetCompiler.h"

//////////////////////////////////////////////////////////////////////////
// FKCHandler_DynamicCast

class FKCHandler_DynamicCast : public FNodeHandlingFunctor
{
protected:
	TMap<UEdGraphNode*, FBPTerminal*> BoolTermMap; // should be deprecated at a certain point (left in for backwards compatibility)
	EKismetCompiledStatementType CastType;

public:
	FKCHandler_DynamicCast(FKismetCompilerContext& InCompilerContext, EKismetCompiledStatementType InCastType)
		: FNodeHandlingFunctor(InCompilerContext)
		, CastType(InCastType)
	{
	}

	virtual void RegisterNets(FKismetFunctionContext& Context, UEdGraphNode* Node) override;
	virtual void RegisterNet(FKismetFunctionContext& Context, UEdGraphPin* Net) override;
	virtual void Compile(FKismetFunctionContext& Context, UEdGraphNode* Node) override;
};