# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VALIGND
    VALIGND = Instruction.new("VALIGND", [
    # valignd: xmm{k}{z}, xmm, m128/m32bcst, imm8
      Form.new([
        OPERAND_TYPES[57],
        OPERAND_TYPES[24],
        OPERAND_TYPES[68],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x03, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_immediate(buffer, operands[3].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # valignd: xmm{k}{z}, xmm, xmm, imm8
      Form.new([
        OPERAND_TYPES[57],
        OPERAND_TYPES[24],
        OPERAND_TYPES[24],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x03, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_immediate(buffer, operands[3].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # valignd: ymm{k}{z}, ymm, m256/m32bcst, imm8
      Form.new([
        OPERAND_TYPES[59],
        OPERAND_TYPES[60],
        OPERAND_TYPES[69],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x03, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_immediate(buffer, operands[3].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # valignd: ymm{k}{z}, ymm, ymm, imm8
      Form.new([
        OPERAND_TYPES[59],
        OPERAND_TYPES[60],
        OPERAND_TYPES[60],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x03, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_immediate(buffer, operands[3].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # valignd: zmm{k}{z}, zmm, m512/m32bcst, imm8
      Form.new([
        OPERAND_TYPES[62],
        OPERAND_TYPES[63],
        OPERAND_TYPES[70],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x03, 0) +
            add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_immediate(buffer, operands[3].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    # valignd: zmm{k}{z}, zmm, zmm, imm8
      Form.new([
        OPERAND_TYPES[62],
        OPERAND_TYPES[63],
        OPERAND_TYPES[63],
        OPERAND_TYPES[1],
      ].freeze, [
        Class.new(Fisk::Encoding) {
          def encode buffer, operands
            add_EVEX(buffer, operands)
            add_opcode(buffer, 0x03, 0) +
            add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[2].op_value, operands) +
            add_immediate(buffer, operands[3].op_value, 1) +
            0
          end
        }.new.freeze,
      ].freeze).freeze,
    ].freeze).freeze
  end
end
