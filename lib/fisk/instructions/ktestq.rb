# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction KTESTQ
    forms = []
    operands = [
        OPERAND_TYPES[42],
        OPERAND_TYPES[42],
    ].freeze
    encodings = [
      Class.new(Fisk::Encoding) {
        def encode buffer, operands
          add_VEX(buffer, operands)
          add_opcode(buffer, 0x99, 0) +
          add_modrm(buffer,
              3,
              operands[0].op_value,
              operands[1].op_value, operands) +
          0
        end
      }.new.freeze,
    ].freeze
    # ktestq: k, k
    forms << Form.new(operands, encodings)
    KTESTQ = Instruction.new("KTESTQ", forms)
  end
end
