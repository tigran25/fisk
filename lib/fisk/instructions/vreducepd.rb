# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VREDUCEPD
    forms = []
    operands = [
        OPERAND_TYPES[57],
        OPERAND_TYPES[58],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x56, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          add_immediate(buffer, operands[2].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # vreducepd: xmm{k}{z}, m128/m64bcst, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[59],
        OPERAND_TYPES[61],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x56, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          add_immediate(buffer, operands[2].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # vreducepd: ymm{k}{z}, m256/m64bcst, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[62],
        OPERAND_TYPES[64],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x56, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          add_immediate(buffer, operands[2].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # vreducepd: zmm{k}{z}, m512/m64bcst, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[57],
        OPERAND_TYPES[24],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x56, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          add_immediate(buffer, operands[2].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # vreducepd: xmm{k}{z}, xmm, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[59],
        OPERAND_TYPES[60],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x56, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          add_immediate(buffer, operands[2].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # vreducepd: ymm{k}{z}, ymm, imm8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[62],
        OPERAND_TYPES[63],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x56, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          add_immediate(buffer, operands[2].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # vreducepd: zmm{k}{z}, zmm, imm8
    forms << Form.new(operands, encodings)
    VREDUCEPD = Instruction.new("VREDUCEPD", forms)
  end
end
