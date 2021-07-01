# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VEXTRACTI64X4
    forms = []
    operands = []
    encodings = []
    # vextracti64x4: ymm{k}{z}, zmm, imm8
    operands << OPERAND_TYPES[59]
    operands << OPERAND_TYPES[63]
    operands << OPERAND_TYPES[1]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_EVEX buffer, operands
        add_opcode buffer, 0x3B, 0
        add_modrm(buffer, operands,
              3,
              operands[1].value,
              operands[0].value)
        add_immediate buffer, operands[2].value, 1
      end

      def bytesize; 3; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    operands = []
    encodings = []
    # vextracti64x4: m256{k}{z}, zmm, imm8
    operands << OPERAND_TYPES[74]
    operands << OPERAND_TYPES[63]
    operands << OPERAND_TYPES[1]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_EVEX buffer, operands
        add_opcode buffer, 0x3B, 0
        add_modrm(buffer, operands,
              0,
              operands[1].value,
              operands[0].value)
        add_immediate buffer, operands[2].value, 1
      end

      def bytesize; 3; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    VEXTRACTI64X4 = Fisk::Machine::Instruction.new("VEXTRACTI64X4", forms)
  end
end
