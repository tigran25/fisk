# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction MOVNTDQA
    forms = []
    operands = [
        OPERAND_TYPES[26],
        OPERAND_TYPES[25],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_prefix(buffer, operands, 0x66, true) +
          add_rex(buffer, operands,
              false,
              0,
              operands[0].rex_value,
              operands[1].rex_value,
              operands[1].rex_value) +
          add_opcode(buffer, 0x0F, 0) +
          add_opcode(buffer, 0x38, 0) +
          add_opcode(buffer, 0x2A, 0) +
          add_modrm(buffer,
              0,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # movntdqa: xmm, m128
    forms << Form.new(operands, encodings)
    MOVNTDQA = Instruction.new("MOVNTDQA", forms)
  end
end
