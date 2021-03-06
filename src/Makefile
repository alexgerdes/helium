#-----------------------------------------------------------------------
#  Compiling attribute grammar code for The Helium Compiler
#  This Makefile only needs to be invoked after modifying files with
#  extension .ag. Otherwise it suffices to use cabal install.
#-----------------------------------------------------------------------

# make		     - build Haskell sources out of AG code
# make cleanag - remove all .hs files that are derivatives of .ag files

default: all
all: ag

AG      = uuagc -P Helium/Syntax -P Helium/StaticAnalysis/StaticChecks -P Helium/StaticAnalysis/Inferencers -P Helium/CodeGeneration -P Helium/StaticAnalysis/Directives
AG_OPTS = -mscfrw --kennedywarren --bangpats

AG_OUT_DIR=../dist/build/autogen/uuagc

# AG sources
AGSOURCES = \
     $(AG_OUT_DIR)/Helium/Syntax/UHA_Pretty.hs \
     $(AG_OUT_DIR)/Helium/Syntax/UHA_OneLine.hs \
     $(AG_OUT_DIR)/Helium/StaticAnalysis/StaticChecks/StaticChecks.hs \
     $(AG_OUT_DIR)/Helium/StaticAnalysis/Inferencers/TypeInferencing.hs \
     $(AG_OUT_DIR)/Helium/StaticAnalysis/Inferencers/KindInferencing.hs \
     $(AG_OUT_DIR)/Helium/CodeGeneration/CodeGeneration.hs \
     $(AG_OUT_DIR)/Helium/Syntax/UHA_Syntax.hs \
     $(AG_OUT_DIR)/Helium/ModuleSystem/ExtractImportDecls.hs \
     $(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_Syntax.hs \
     $(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_Apply.hs \
     $(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_Analyse.hs \
     $(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_CoreSyntax.hs \
     $(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_ToCore.hs \
     $(AG_OUT_DIR)/Helium/Parser/ResolveOperators.hs

libraries:
	@echo "****************************************************"
	@echo "  Libraries (with overloading)"
	@echo "****************************************************"
	cd ../lib; $(MAKE) 
	@echo "****************************************************"
	@echo "  Simple libraries (without overloading)"
	@echo "****************************************************"
	cd ../lib/simple; $(MAKE) 

# AG sources

ag : $(AGSOURCES)

cleanag : 
	$(RM) $(AGSOURCES)

ifdef AG
$(AG_OUT_DIR)/Helium/Parser/ResolveOperators.hs : \
		Helium/Parser/ResolveOperators.ag \
		Helium/Syntax/UHA_Syntax.ag
	mkdir -p `dirname $@`
	# AG ResolveOperators
	$(AG) $(AG_OPTS) --self --module=Helium.Parser.ResolveOperators Helium/Parser/ResolveOperators.ag --output=$@

$(AG_OUT_DIR)/Helium/Syntax/UHA_Pretty.hs : \
		Helium/Syntax/UHA_Pretty.ag Helium/Syntax/UHA_Syntax.ag
	mkdir -p `dirname $@`
	# AG UHA_Pretty
	$(AG) $(AG_OPTS) --module=Helium.Syntax.UHA_Pretty Helium/Syntax/UHA_Pretty.ag --output=$@

$(AG_OUT_DIR)/Helium/Syntax/UHA_OneLine.hs : \
		Helium/Syntax/UHA_OneLine.ag Helium/Syntax/UHA_Syntax.ag
	mkdir -p `dirname $@`
	# AG UHA_OneLine
	$(AG) $(AG_OPTS) --self --module=Helium.Syntax.UHA_OneLine Helium/Syntax/UHA_OneLine.ag --output=$@

$(AG_OUT_DIR)/Helium/StaticAnalysis/StaticChecks/StaticChecks.hs : \
		Helium/StaticAnalysis/StaticChecks/StaticChecks.ag \
		Helium/StaticAnalysis/StaticChecks/KindChecking.ag \
    Helium/StaticAnalysis/StaticChecks/TopLevelErrors.ag \
    Helium/StaticAnalysis/StaticChecks/MiscErrors.ag \
    Helium/StaticAnalysis/StaticChecks/Warnings.ag \
		Helium/StaticAnalysis/StaticChecks/ExportErrors.ag \
    Helium/StaticAnalysis/StaticChecks/Collect.ag \
    Helium/StaticAnalysis/StaticChecks/HeliumPartialSyntax.ag \
    Helium/StaticAnalysis/StaticChecks/Scope.ag \
    Helium/StaticAnalysis/StaticChecks/ScopeErrors.ag \
		Helium/Syntax/UHA_Syntax.ag 
	mkdir -p `dirname $@`
	# AG StaticAnalysis
	$(AG) $(AG_OPTS) --self --module=Helium.StaticAnalysis.StaticChecks.StaticChecks Helium/StaticAnalysis/StaticChecks/StaticChecks.ag --output=$@

$(AG_OUT_DIR)/Helium/StaticAnalysis/Inferencers/TypeInferencing.hs : \
		Helium/StaticAnalysis/Inferencers/TypeInferencing.ag \
    Helium/StaticAnalysis/Inferencers/TypeInferenceRules.ag \
    Helium/StaticAnalysis/Inferencers/TypeInferenceOverloading.ag \
    Helium/StaticAnalysis/Inferencers/TypeInferenceCollect.ag \
    Helium/StaticAnalysis/Inferencers/TypeInferenceInfo.ag \
    Helium/StaticAnalysis/Inferencers/PatternMatchWarnings.ag \
    Helium/StaticAnalysis/Inferencers/LocalInfo.ag \
    Helium/StaticAnalysis/Inferencers/GlobalInfo.ag \
    Helium/StaticAnalysis/StaticChecks/HeliumPartialSyntax.ag \
		Helium/Syntax/UHA_Syntax.ag \
    Helium/StaticAnalysis/StaticChecks/Scope.ag\
    Helium/StaticAnalysis/Directives/TS_PatternMatching.ag
	mkdir -p `dirname $@`
	# AG TypeInferencing
	$(AG) $(AG_OPTS) --self --module=Helium.StaticAnalysis.Inferencers.TypeInferencing Helium/StaticAnalysis/Inferencers/TypeInferencing.ag --output=$@

$(AG_OUT_DIR)/Helium/StaticAnalysis/Inferencers/KindInferencing.hs : \
		Helium/StaticAnalysis/Inferencers/KindInferencing.ag \
    Helium/Syntax/UHA_Syntax.ag
	mkdir -p `dirname $@`
	# AG TypeInferencing
	$(AG) $(AG_OPTS) --self --module=Helium.StaticAnalysis.Inferencers.KindInferencing Helium/StaticAnalysis/Inferencers/KindInferencing.ag --output=$@

$(AG_OUT_DIR)/Helium/CodeGeneration/CodeGeneration.hs : \
		Helium/CodeGeneration/CodeGeneration.ag \
		Helium/Syntax/UHA_Syntax.ag \
		Helium/CodeGeneration/ToCoreModule.ag \
		Helium/CodeGeneration/ToCoreDecl.ag \
		Helium/CodeGeneration/ToCoreExpr.ag \
		Helium/CodeGeneration/ToCorePat.ag \
		Helium/CodeGeneration/ToCoreName.ag
	mkdir -p `dirname $@`
	# AG CodeGeneration
	$(AG) $(AG_OPTS) --self --module=Helium.CodeGeneration.CodeGeneration Helium/CodeGeneration/CodeGeneration.ag --output=$@

$(AG_OUT_DIR)/Helium/Syntax/UHA_Syntax.hs : Helium/Syntax/UHA_Syntax.ag
	mkdir -p `dirname $@`
	# AG UHA_Syntax
	$(AG) -dmr --module=Helium.Syntax.UHA_Syntax Helium/Syntax/UHA_Syntax.ag --output=$@

$(AG_OUT_DIR)/Helium/ModuleSystem/ExtractImportDecls.hs : \
		Helium/ModuleSystem/ExtractImportDecls.ag \
		Helium/CodeGeneration/ToCoreName.ag \
		Helium/Syntax/UHA_Syntax.ag
	mkdir -p `dirname $@`
	# AG ExtractImportDecls
	$(AG) $(AG_OPTS) --self --module=Helium.ModuleSystem.ExtractImportDecls Helium/ModuleSystem/ExtractImportDecls.ag --output=$@
        
$(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_Syntax.hs : \
	  Helium/StaticAnalysis/Directives/TS_Syntax.ag
	mkdir -p `dirname $@`
	# AG TS_Syntax
	$(AG) -dmr --module=Helium.StaticAnalysis.Directives.TS_Syntax Helium/StaticAnalysis/Directives/TS_Syntax.ag --output=$@

$(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_Analyse.hs : \
    Helium/StaticAnalysis/Directives/TS_Syntax.ag \
    Helium/StaticAnalysis/Directives/TS_Collect.ag \
    Helium/StaticAnalysis/Directives/TS_Analyse.ag \
    Helium/Syntax/UHA_Syntax.ag
	mkdir -p `dirname $@`
	# AG TS_Analyse
	$(AG) $(AG_OPTS) --self --module=Helium.StaticAnalysis.Directives.TS_Analyse Helium/StaticAnalysis/Directives/TS_Analyse.ag --output=$@

$(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_Apply.hs : \
    Helium/StaticAnalysis/Directives/TS_Syntax.ag \
    Helium/StaticAnalysis/Directives/TS_Collect.ag \
    Helium/StaticAnalysis/Directives/TS_Apply.ag \
    Helium/StaticAnalysis/Directives/TS_CoreSyntax.ag \
    Helium/Syntax/UHA_Syntax.ag
	mkdir -p `dirname $@`
	# AG TS_Syntax
	$(AG) -mscfw --module=Helium.StaticAnalysis.Directives.TS_Apply Helium/StaticAnalysis/Directives/TS_Apply.ag --output=$@

$(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_CoreSyntax.hs : \
	  Helium/StaticAnalysis/Directives/TS_CoreSyntax.ag \

	mkdir -p `dirname $@`
	# AG TS_CoreSyntax
	$(AG) -md --module=Helium.StaticAnalysis.Directives.TS_CoreSyntax Helium/StaticAnalysis/Directives/TS_CoreSyntax.ag --output=$@

$(AG_OUT_DIR)/Helium/StaticAnalysis/Directives/TS_ToCore.hs : \
    Helium/StaticAnalysis/Directives/TS_Syntax.ag \
    Helium/StaticAnalysis/Directives/TS_Collect.ag \
    Helium/StaticAnalysis/Directives/TS_ToCore.ag \
    Helium/Syntax/UHA_Syntax.ag \
    Helium/Syntax/UHA_OneLine.ag 
	mkdir -p `dirname $@`
	# AG TS_Syntax
	$(AG) -mscrfw --self --module=Helium.StaticAnalysis.Directives.TS_ToCore Helium/StaticAnalysis/Directives/TS_ToCore.ag --output=$@
endif

