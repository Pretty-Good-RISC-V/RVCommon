`ifdef RV128
typedef 128 XLEN;
`elsif RV64
typedef 64 XLEN;
`else
typedef 32 XLEN;
`endif

typedef Bit#(3) RVFunc3;  // Corresponds to the func3 instruction field.

//
// RVALUOperator
//
typedef Bit#(10) RVALUOperator;
// ALU Operators: These are decoded as the concat of func7 and func3
RVALUOperator alu_ADD    = 10'b0000000_000;
RVALUOperator alu_SLL    = 10'b0000000_001;
RVALUOperator alu_SLT    = 10'b0000000_010;
RVALUOperator alu_SLTU   = 10'b0000000_011;
RVALUOperator alu_XOR    = 10'b0000000_100;
RVALUOperator alu_SRL    = 10'b0000000_101;
RVALUOperator alu_OR     = 10'b0000000_110;
RVALUOperator alu_AND    = 10'b0000000_111;
RVALUOperator alu_MUL    = 10'b0000001_000;
RVALUOperator alu_MULH   = 10'b0000001_001;
RVALUOperator alu_MULHSU = 10'b0000001_010;
RVALUOperator alu_MULHU  = 10'b0000001_011;
RVALUOperator alu_DIV    = 10'b0000001_100;
RVALUOperator alu_DIVU   = 10'b0000001_101;
RVALUOperator alu_REM    = 10'b0000001_110;
RVALUOperator alu_REMU   = 10'b0000001_111;
RVALUOperator alu_SUB    = 10'b0100000_000;
RVALUOperator alu_SRA    = 10'b0100000_101;

//
// RVBranchOperator(s)
//
typedef RVFunc3 RVBranchOperator;
RVBranchOperator branch_BEQ  = 3'b000;
RVBranchOperator branch_BNE  = 3'b001;
RVBranchOperator branch_UNSUPPORTED_010 = 3'b010;
RVBranchOperator branch_UNSUPPORTED_011 = 3'b011;
RVBranchOperator branch_BLT  = 3'b100;
RVBranchOperator branch_BGE  = 3'b101;
RVBranchOperator branch_BLTU = 3'b110;
RVBranchOperator branch_BGEU = 3'b111;

//
// RVCSROperator(s)
//
typedef RVFunc3 RVCSROperator;
RVCSROperator csr_UNSUPPORTED_000 = 3'b000;
RVCSROperator csr_CSRRW  = 3'b001;
RVCSROperator csr_CSRRS  = 3'b010;
RVCSROperator csr_CSRRC  = 3'b011;
RVCSROperator csr_UNSUPPORTED_100 = 3'b100;
RVCSROperator csr_CSRRWI = 3'b101;
RVCSROperator csr_CSRRSI = 3'b110;
RVCSROperator csr_CSRRCI = 3'b111;

//
// RVExceptionCause(s)
//
typedef Bit#(TSub#(XLEN, 1)) RVExceptionCause;
RVExceptionCause exception_INSTRUCTION_ADDRESS_MISALIGNED = 0;
RVExceptionCause exception_INSTRUCTION_ACCESS_FAULT = 1;
RVExceptionCause exception_ILLEGAL_INSTRUCTION = 2;
RVExceptionCause exception_BREAKPOINT = 3;
RVExceptionCause exception_LOAD_ADDRESS_MISALIGNED = 4;
RVExceptionCause exception_LOAD_ACCESS_FAULT = 5;
RVExceptionCause exception_STORE_ADDRESS_MISALIGNED = 6;
RVExceptionCause exception_STORE_ADDRESS_FAULT = 7;
RVExceptionCause exception_ENVIRONMENT_CALL_FROM_U_MODE = 8;
RVExceptionCause exception_ENVIRONMENT_CALL_FROM_S_MODE = 9;
RVExceptionCause exception_RESERVED_10 = 10;
RVExceptionCause exception_ENVIRONMENT_CALL_FROM_M_MODE = 11;
RVExceptionCause exception_INSTRUCTION_PAGE_FAULT = 12;
RVExceptionCause exception_LOAD_PAGE_FAULT = 13;
RVExceptionCause exception_RESERVED_14 = 14;
RVExceptionCause exception_STORE_PAGE_FAULT = 15;

//
// RVInterruptCause(s)
//
typedef Bit#(TSub#(XLEN, 1)) RVInterruptCause;
RVInterruptCause interrupt_SUPERVISOR_SOFTWARE_INTERRUPT = 1;
RVInterruptCause interrupt_MACHINE_SOFTWARE_INTERRUPT = 3;
RVInterruptCause interrupt_SUPERVISOR_TIMER_INTERRUPT = 5;
RVInterruptCause interrupt_MACHINE_TIMER_INTERRUPT = 7;
RVInterruptCause interrupt_SUPERVISOR_EXTERNAL_INTERRUPT = 9;
RVInterruptCause interrupt_MACHINE_EXTERNAL_INTERRUPT = 11;

//
// RVLoadOperator(s)
//
typedef RVFunc3 RVLoadOperator;
RVLoadOperator load_LB  = 3'b000;
RVLoadOperator load_LH  = 3'b001;
RVLoadOperator load_LW  = 3'b010;
`ifdef RV32
RVLoadOperator load_UNSUPPORTED_011 = 3'b011;
`elsif RV64
RVLoadOperator load_LD = 3'b011;
`endif
RVLoadOperator load_LBU = 3'b100;
RVLoadOperator load_LHU = 3'b101;
`ifdef RV32
RVLoadOperator load_UNSUPPORTED_110 = 3'b110;
`elsif RV64
RVLoadOperator load_LWU = 3'b110;
`endif
RVLoadOperator load_UNSUPPORTED_111 = 3'b111;

//
// RVPrivilegeLevel
//
typedef Bit#(2) RVPrivilegeLevel;
RVPrivilegeLevel priv_USER        = 2'b00;
RVPrivilegeLevel priv_SUPERVISOR  = 2'b01;
RVPrivilegeLevel priv_HYPERVISOR  = 2'b10;
RVPrivilegeLevel priv_MACHINE     = 2'b11;

//
// RVStoreOoperator(s)
//
typedef RVFunc3 RVStoreOperator;
RVStoreOperator store_SB  = 3'b000;
RVStoreOperator store_SH  = 3'b001;
RVStoreOperator store_SW  = 3'b010;
`ifdef RV32
RVStoreOperator store_UNSUPPORTED_011 = 3'b011;
`elsif RV64
RVStoreOperator store_SD = 3'b011;
`endif
RVStoreOperator store_UNSUPPORTED_100 = 3'b100;
RVStoreOperator store_UNSUPPORTED_101 = 3'b101;
RVStoreOperator store_UNSUPPORTED_110 = 3'b110;
RVStoreOperator store_UNSUPPORTED_111 = 3'b111;

//
// RVSystemOperator(s)
//
typedef Bit#(3) RVSystemOperator;
RVSystemOperator sys_ECALL  = 3'b000;
RVSystemOperator sys_EBREAK = 3'b001;
RVSystemOperator sys_SRET   = 3'b010;
RVSystemOperator sys_MRET   = 3'b011;
RVSystemOperator sys_WFI    = 3'b100;
