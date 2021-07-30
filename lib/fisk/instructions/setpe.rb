# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction SETPE
    forms = []
    operands = [
        OPERAND_TYPES[47],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              operands[0].rex_value) +
          add_opcode(buffer, 0x0F, 0) +
          add_opcode(buffer, 0x9A, 0) +
          add_modrm(buffer,
              3,
              0,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # setpe: r8
    forms << Form.new(operands, encodings)
    operands = [
        OPERAND_TYPES[43],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              0,
              operands[0].rex_value,
              operands[0].rex_value) +
          add_opcode(buffer, 0x0F, 0) +
          add_opcode(buffer, 0x9A, 0) +
          add_modrm(buffer,
              0,
              0,
              operands[0].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # setpe: m8
    forms << Form.new(operands, encodings)
    SETPE = Instruction.new("SETPE", forms)
  end
end
