# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction MOVHLPS
    forms = []
    operands = [
        OPERAND_TYPES[23],
        OPERAND_TYPES[24],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              0,
              operands[1].rex_value) +
          add_opcode(buffer, 0x0F, 0) +
          add_opcode(buffer, 0x12, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # movhlps: xmm, xmm
    forms << Form.new(operands, encodings)
    MOVHLPS = Instruction.new("MOVHLPS", forms)
  end
end
