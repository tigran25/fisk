# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction KSHIFTLQ
    forms = []
    operands = [
        OPERAND_TYPES[41],
        OPERAND_TYPES[42],
        OPERAND_TYPES[1],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x33, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          add_immediate(buffer, operands[2].op_value, 1) +
          0
        end
      }.new.freeze,
    ].freeze
    # kshiftlq: k, k, imm8
    forms << Form.new(operands, encodings)
    KSHIFTLQ = Instruction.new("KSHIFTLQ", forms)
  end
end
