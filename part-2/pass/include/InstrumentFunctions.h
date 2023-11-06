#ifndef CS8395_INSTRUMENTATION_H
#define CS8395_INSTRUMENTATION_H

#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"

//------------------------------------------------------------------------------
// New PM interface
//------------------------------------------------------------------------------
struct InstrumentFunctions : public llvm::PassInfoMixin<InstrumentFunctions> {
  llvm::PreservedAnalyses run(llvm::Module &M,
                              llvm::ModuleAnalysisManager &);
  bool runOnModule(llvm::Module &M);
};

//------------------------------------------------------------------------------
// Legacy PM interface
//------------------------------------------------------------------------------
struct LegacyInstrumentFunctions : public llvm::ModulePass {
  static char ID;
  LegacyInstrumentFunctions() : ModulePass(ID) {}
  bool runOnModule(llvm::Module &M) override;

  InstrumentFunctions Impl;
};

#endif
