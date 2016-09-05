#!/bin/bash

			JARS=libs/instantiator/*:libs/plugins/*:libs/ivy/default/*
			ARGS=$*
			
				
			
			echo 'jars are: '$JARS
			echo 'args are: '$ARGS

			java -cp modelioGen.jar:$JARS com.mondo.modelio.atl.instantiator.Launcher $ARGS
		
