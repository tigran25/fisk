# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VRANGESS: Range Restriction Calculation For a pair of Scalar Single-Precision Floating-Point Values
    VRANGESS = Instruction.new("VRANGESS", [
    # vrangess: xmm{k}{z}, xmm, m32, imm8
      Form.new([
        OPERAND_TYPES[57],
        OPERAND_TYPES[24],
        OPERAND_TYPES[14],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x51, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_immediate(buffer, operands[3].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # vrangess: xmm{k}{z}, xmm, xmm, {sae}, imm8
      Form.new([
        OPERAND_TYPES[57],
        OPERAND_TYPES[24],
        OPERAND_TYPES[24],
        OPERAND_TYPES[72],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x51, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_immediate(buffer, operands[4].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
