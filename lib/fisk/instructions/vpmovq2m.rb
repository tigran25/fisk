# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction VPMOVQ2M
    forms = []
    operands = [
        OPERAND_TYPES[41],
        OPERAND_TYPES[24],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x39, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpmovq2m: k, xmm
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[41],
        OPERAND_TYPES[60],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x39, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpmovq2m: k, ymm
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[41],
        OPERAND_TYPES[63],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_EVEX(buffer, operands)
          add_opcode(buffer, 0x39, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # vpmovq2m: k, zmm
    forms << Form.new(operands, encodings)
    VPMOVQ2M = Instruction.new("VPMOVQ2M", forms)
  end
end
