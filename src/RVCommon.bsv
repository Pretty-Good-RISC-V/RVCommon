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
// ALU Operators: These are decoded as the concat of a single bit indicating if a 6432 operation and func7 and func3
RVALUOperator alu_ADD    = 11'b0_0000000_000;
RVALUOperator alu_SLL    = 11'b0_0000000_001;
RVALUOperator alu_SLT    = 11'b0_0000000_010;
RVALUOperator alu_SLTU   = 11'b0_0000000_011;
RVALUOperator alu_XOR    = 11'b0_0000000_100;
RVALUOperator alu_SRL    = 11'b0_0000000_101;
RVALUOperator alu_OR     = 11'b0_0000000_110;
RVALUOperator alu_AND    = 11'b0_0000000_111;
RVALUOperator alu_MUL    = 11'b0_0000001_000;
RVALUOperator alu_MULH   = 11'b0_0000001_001;
RVALUOperator alu_MULHSU = 11'b0_0000001_010;
RVALUOperator alu_MULHU  = 11'b0_0000001_011;
RVALUOperator alu_DIV    = 11'b0_0000001_100;
RVALUOperator alu_DIVU   = 11'b0_0000001_101;
RVALUOperator alu_REM    = 11'b0_0000001_110;
RVALUOperator alu_REMU   = 11'b0_0000001_111;
RVALUOperator alu_SUB    = 11'b0_0100000_000;
RVALUOperator alu_SRA    = 11'b0_0100000_101;
RVALUOperator alu_ADD32  = 11'b1_0000000_000;
RVALUOperator alu_SLL32  = 11'b1_0000000_001;
RVALUOperator alu_SRL32  = 11'b1_0000000_101;
RVALUOperator alu_SUB32  = 11'b1_0100000_000;
RVALUOperator alu_SRA32  = 11'b1_0100000_101;

//
// RVBranchOperator(s)
//
typedef RVFunc3 RVBranchOperator;
RVBranchOperator branch_BEQ             = 3'b000;
RVBranchOperator branch_BNE             = 3'b001;
RVBranchOperator branch_UNSUPPORTED_010 = 3'b010;
RVBranchOperator branch_UNSUPPORTED_011 = 3'b011;
RVBranchOperator branch_BLT             = 3'b100;
RVBranchOperator branch_BGE             = 3'b101;
RVBranchOperator branch_BLTU            = 3'b110;
RVBranchOperator branch_BGEU            = 3'b111;

//
// RVCSRIndex
//
typedef Bit#(12) RVCSRIndex;
// Supervisor Trap Setup
RVCSRIndex csr_SSTATUS         = 12'h100;    // Supervisor Status Register (SRW)
RVCSRIndex csr_SIE             = 12'h104;    // Supervisor Interrupt Enable Register (SRW)
RVCSRIndex csr_STVEC           = 12'h105;    // Supervisor Trap-Handler base address (SRW)
RVCSRIndex csr_SCOUNTEREN      = 12'h106;    // Supervisor Counter Enable Register (SRW)
// Supervisor Configuration
RVCSRIndex csr_SENVCFG         = 12'h10A;    // Supervisor environment configuration register (SRW)
// Supervisor Trap Handling
RVCSRIndex csr_SSCRATCH        = 12'h140;    // Scratch register for supervisor trap handlers (SRW)
RVCSRIndex csr_SEPC            = 12'h141;    // Supervisor exception program counter (SRW)
RVCSRIndex csr_SCAUSE          = 12'h142;    // Supervisor trap cause (SRW)
RVCSRIndex csr_STVAL           = 12'h143;    // Supervisor bad address or instruction (SRW)
RVCSRIndex csr_SIP             = 12'h144;    // Supervisor interrupt pending (SRW)
// Supervisor Protection and Translation
RVCSRIndex csr_SATP            = 12'h180;    // Supervisor address translation and protection (SRW)
// Machine Trap Setup
RVCSRIndex csr_MSTATUS         = 12'h300;    // Machine Status Register (MRW)
RVCSRIndex csr_MISA            = 12'h301;    // Machine ISA and Extensions Register (MRW)
RVCSRIndex csr_MEDELEG         = 12'h302;    // Machine Exception Delegation Register (MRW)
RVCSRIndex csr_MIDELEG         = 12'h303;    // Machine Interrupt Delegation Register (MRW)
RVCSRIndex csr_MIE             = 12'h304;    // Machine Interrupt Enable Register (MRW)
RVCSRIndex csr_MTVEC           = 12'h305;    // Machine Trap-Handler base address (MRW)
RVCSRIndex csr_MCOUNTEREN      = 12'h306;    // Machine Counter Enable Register (MRW)
`ifdef RV32
RVCSRIndex csr_MSTATUSH        = 12'h310;    // Additional machine status register, RV32 only (MRW)
`endif
// Machine Trap Handling
RVCSRIndex csr_MSCRATCH        = 12'h340;    // Scratch register for machine trap handlers (MRW)
RVCSRIndex csr_MEPC            = 12'h341;    // Machine exception program counter (MRW)
RVCSRIndex csr_MCAUSE          = 12'h342;    // Machine trap cause (MRW)
RVCSRIndex csr_MTVAL           = 12'h343;    // Machine bad address or instruction (MRW)
RVCSRIndex csr_MIP             = 12'h344;    // Machine interrupt pending (MRW)
RVCSRIndex csr_MTINST          = 12'h34A;    // Machine trap instruction (transformed) (MRW)
RVCSRIndex csr_MTVAL2          = 12'h34B;    // Machine bad guest physical address (MRW)
// Machine Memory Protection
RVCSRIndex csr_PMPCFG0         = 12'h3A0;    // Physical memory protection configuration (MRW)
RVCSRIndex csr_PMPCFG15        = 12'h3AF; 
RVCSRIndex csr_PMPADDR0        = 12'h3B0;    // Physical memory protection address register (MRW)
RVCSRIndex csr_PMPADDR63       = 12'h3EF;
// Debug/Trace Registers
RVCSRIndex csr_TSELECT         = 12'h7A0;    // Debug/Trace trigger register select (MRW)
RVCSRIndex csr_TDATA1          = 12'h7A1;    // First Debug/Trace trigger data register (MRW)
RVCSRIndex csr_TDATA2          = 12'h7A2;    // Second Debug/Trace trigger data register (MRW)
RVCSRIndex csr_TDATA3          = 12'h7A3;    // Third Debug/Trace trigger data register (MRW)
RVCSRIndex csr_MCONTEXT        = 12'h7A8;    // Machine-mode context register (MRW)
// Debug Mode Registers
RVCSRIndex csr_DCSR            = 12'h7B0;    // Debug Control and Status
RVCSRIndex csr_DPC             = 12'h7B1;    // Debug Program Counter
RVCSRIndex csr_DSCRATCH0       = 12'h7B2;    // Debug Scratch Register 0
RVCSRIndex csr_DSCRATCH1       = 12'h7B3;    // Debug Scratch Register 1
// Machine Counters/Timers
RVCSRIndex csr_MCYCLE          = 12'hB00;    // Cycle counter for RDCYCLE instruction (MRW)
RVCSRIndex csr_MINSTRET        = 12'hB02;    // Machine instructions-retired counter (MRW)
RVCSRIndex csr_MHPMCOUNTER3    = 12'hB03;    // Machine performance-monitoring counter (MRW)
RVCSRIndex csr_MHPMCOUNTER4    = 12'hB04;    // Machine performance-monitoring counter (MRW)
RVCSRIndex csr_MHPMCOUNTER5    = 12'hB05;    // Machine performance-monitoring counter (MRW)
RVCSRIndex csr_MHPMCOUNTER6    = 12'hB06;    // Machine performance-monitoring counter (MRW)
RVCSRIndex csr_MHPMCOUNTER7    = 12'hB07;    // Machine performance-monitoring counter (MRW)
RVCSRIndex csr_MHPMCOUNTER8    = 12'hB08;    // Machine performance-monitoring counter (MRW)
RVCSRIndex csr_MHPMCOUNTER9    = 12'hB09;    // Machine performance-monitoring counter (MRW)
`ifdef RV32
RVCSRIndex csr_MCYCLEH         = 12'hB80;    // Upper 32 bits of mcycle, RV32I only (MRW)
RVCSRIndex csr_MINSTRETH       = 12'hB82;    // Upper 32 bits of minstret, RV32I only (MRW)    
RVCSRIndex csr_MHPMCOUNTER3H   = 12'hB83;    // Machine performance-monitoring counter (upper 32 bits) (MRW)
RVCSRIndex csr_MHPMCOUNTER4H   = 12'hB84;    // Machine performance-monitoring counter (upper 32 bits) (MRW)
RVCSRIndex csr_MHPMCOUNTER5H   = 12'hB85;    // Machine performance-monitoring counter (upper 32 bits) (MRW)
RVCSRIndex csr_MHPMCOUNTER6H   = 12'hB86;    // Machine performance-monitoring counter (upper 32 bits) (MRW)
RVCSRIndex csr_MHPMCOUNTER7H   = 12'hB87;    // Machine performance-monitoring counter (upper 32 bits) (MRW)
RVCSRIndex csr_MHPMCOUNTER8H   = 12'hB88;    // Machine performance-monitoring counter (upper 32 bits) (MRW)
RVCSRIndex csr_MHPMCOUNTER9H   = 12'hB89;    // Machine performance-monitoring counter (upper 32 bits) (MRW)
`endif
RVCSRIndex csr_CYCLE           = 12'hC00;    // Read only mirror of MCYCLE
// Machine Information Registers
RVCSRIndex csr_MVENDORID       = 12'hF11;    // Vendor ID (MRO)
RVCSRIndex csr_MARCHID         = 12'hF12;    // Architecture ID (MRO)
RVCSRIndex csr_MIMPID          = 12'hF13;    // Implementation ID (MRO)
RVCSRIndex csr_MHARTID         = 12'hF14;    // Hardware thread ID (MRO)
RVCSRIndex csr_MCONFIGPTR      = 12'hF15;    // Pointer to configuration data structure (MRO)

//
// RVCSRIndexOffset
//
typedef Bit#(8) RVCSRIndexOffset;
// Trap Setup
RVCSRIndexOffset csr_STATUS    = 8'h00;      // Status
RVCSRIndexOffset csr_EDELEG    = 8'h02;      // Exception Delegation
RVCSRIndexOffset csr_IDELEG    = 8'h03;      // Interrupt Delegation
RVCSRIndexOffset csr_IE        = 8'h04;      // Interrupt Enable
RVCSRIndexOffset csr_TVEC      = 8'h05;      // Vector Table
RVCSRIndexOffset csr_COUNTEREN = 8'h06;      // Counter Enable
// Trap Handling
RVCSRIndexOffset csr_SCRATCH   = 8'h40;      // Scratch Register
RVCSRIndexOffset csr_EPC       = 8'h41;      // Exception Program Counter
RVCSRIndexOffset csr_CAUSE     = 8'h42;      // Exception/Interrupt Cause
RVCSRIndexOffset csr_TVAL      = 8'h43;      // Bad address or instruction
RVCSRIndexOffset csr_IP        = 8'h44;      // Interrupt Pending

//
// RVCSROperator(s)
//
typedef RVFunc3 RVCSROperator;
RVCSROperator csr_UNSUPPORTED_000 = 3'b000;
RVCSROperator csr_CSRRW           = 3'b001;
RVCSROperator csr_CSRRS           = 3'b010;
RVCSROperator csr_CSRRC           = 3'b011;
RVCSROperator csr_UNSUPPORTED_100 = 3'b100;
RVCSROperator csr_CSRRWI          = 3'b101;
RVCSROperator csr_CSRRSI          = 3'b110;
RVCSROperator csr_CSRRCI          = 3'b111;

//
// RVExceptionCause(s)
//
typedef Bit#(TSub#(XLEN, 1)) RVExceptionCause;
RVExceptionCause exception_INSTRUCTION_ADDRESS_MISALIGNED = 0;
RVExceptionCause exception_INSTRUCTION_ACCESS_FAULT       = 1;
RVExceptionCause exception_ILLEGAL_INSTRUCTION            = 2;
RVExceptionCause exception_BREAKPOINT                     = 3;
RVExceptionCause exception_LOAD_ADDRESS_MISALIGNED        = 4;
RVExceptionCause exception_LOAD_ACCESS_FAULT              = 5;
RVExceptionCause exception_STORE_ADDRESS_MISALIGNED       = 6;
RVExceptionCause exception_STORE_ACCESS_FAULT             = 7;
RVExceptionCause exception_ENVIRONMENT_CALL_FROM_U_MODE   = 8;
RVExceptionCause exception_ENVIRONMENT_CALL_FROM_S_MODE   = 9;
RVExceptionCause exception_RESERVED_10                    = 10;
RVExceptionCause exception_ENVIRONMENT_CALL_FROM_M_MODE   = 11;
RVExceptionCause exception_INSTRUCTION_PAGE_FAULT         = 12;
RVExceptionCause exception_LOAD_PAGE_FAULT                = 13;
RVExceptionCause exception_RESERVED_14                    = 14;
RVExceptionCause exception_STORE_PAGE_FAULT               = 15;

//
// RVGPRIndex
//
typedef Bit#(5) RVGPRIndex;

//
// RVISAExtension
//
typedef Bit#(26) RVISAExtension;
RVISAExtension isaext_A = 26'h000001;     // Atomic extension
RVISAExtension isaext_B = 26'h000002;     // Tentatively reserved for Bit-Manipulation extension
RVISAExtension isaext_C = 26'h000004;     // Compressed extension
RVISAExtension isaext_D = 26'h000008;     // Double-precision floating-point extension
RVISAExtension isaext_E = 26'h000010;     // RV32E base ISA
RVISAExtension isaext_F = 26'h000020;     // Single-precision floating-point extension
RVISAExtension isaext_G = 26'h000040;     // __ RESERVED __
RVISAExtension isaext_H = 26'h000080;     // Hypervisor extension
RVISAExtension isaext_I = 26'h000100;     // RV32I/64I/128I base ISA
RVISAExtension isaext_J = 26'h000200;     // Tentatively reserved for Dynamically Translated Languages extension
RVISAExtension isaext_K = 26'h000400;     // __ RESERVED __
RVISAExtension isaext_L = 26'h000800;     // __ RESERVED __
RVISAExtension isaext_M = 26'h001000;     // Integer Multiply/Divide extension
RVISAExtension isaext_N = 26'h002000;     // Tentatively reserved for User-Level Interrupts extension
RVISAExtension isaext_O = 26'h004000;     // __ RESERVED __
RVISAExtension isaext_P = 26'h008000;     // Tentatively reserved for Packed-SIMD extension
RVISAExtension isaext_Q = 26'h010000;     // Quad-precision floating-point extension
RVISAExtension isaext_R = 26'h020000;     // __ RESERVED __
RVISAExtension isaext_S = 26'h040000;     // Supervisor mode implemented
RVISAExtension isaext_T = 26'h080000;     // __ RESERVED __
RVISAExtension isaext_U = 26'h100000;     // User mode implemented
RVISAExtension isaext_V = 26'h200000;     // Tentatively reserved for Vector extension
RVISAExtension isaext_W = 26'h400000;     // __ RESERVED __
RVISAExtension isaext_X = 26'h800000;      // Non-standard extensions present

//
// RVInterruptCause(s)
//
typedef Bit#(TSub#(XLEN, 1)) RVInterruptCause;
RVInterruptCause interrupt_SUPERVISOR_SOFTWARE_INTERRUPT = 1;
RVInterruptCause interrupt_MACHINE_SOFTWARE_INTERRUPT    = 3;
RVInterruptCause interrupt_SUPERVISOR_TIMER_INTERRUPT    = 5;
RVInterruptCause interrupt_MACHINE_TIMER_INTERRUPT       = 7;
RVInterruptCause interrupt_SUPERVISOR_EXTERNAL_INTERRUPT = 9;
RVInterruptCause interrupt_MACHINE_EXTERNAL_INTERRUPT    = 11;

//
// RVLoadOperator(s)
//
typedef RVFunc3 RVLoadOperator;
RVLoadOperator load_LB              = 3'b000;
RVLoadOperator load_LH              = 3'b001;
RVLoadOperator load_LW              = 3'b010;
`ifdef RV32
RVLoadOperator load_UNSUPPORTED_011 = 3'b011;
`elsif RV64
RVLoadOperator load_LD              = 3'b011;
`endif
RVLoadOperator load_LBU             = 3'b100;
RVLoadOperator load_LHU             = 3'b101;
`ifdef RV32
RVLoadOperator load_UNSUPPORTED_110 = 3'b110;
`elsif RV64
RVLoadOperator load_LWU             = 3'b110;
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
