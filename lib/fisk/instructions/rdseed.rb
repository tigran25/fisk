# frozen_string_literal: true

class Fisk
  module Instructions
    # Instruction RDSEED
    forms = []
    operands = []
    encodings = []
    # rdseed: r16
    operands << OPERAND_TYPES[38]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_prefix buffer, operands, 0x66, false
        add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              (operands[0].value >> 3))
        add_opcode buffer, 0x0F, 0
        add_opcode buffer, 0xC7, 0
        add_modrm(buffer, operands,
              3,
              7,
              operands[0].value)
      end

      def bytesize; 3; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    operands = []
    encodings = []
    # rdseed: r32
    operands << OPERAND_TYPES[27]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_rex(buffer, operands,
              false,
              0,
              0,
              0,
              (operands[0].value >> 3))
        add_opcode buffer, 0x0F, 0
        add_opcode buffer, 0xC7, 0
        add_modrm(buffer, operands,
              3,
              7,
              operands[0].value)
      end

      def bytesize; 3; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    operands = []
    encodings = []
    # rdseed: r64
    operands << OPERAND_TYPES[28]
    encodings << Class.new(Fisk::Machine::Encoding) {
      def encode buffer, operands
        add_rex(buffer, operands,
              true,
              1,
              0,
              0,
              (operands[0].value >> 3))
        add_opcode buffer, 0x0F, 0
        add_opcode buffer, 0xC7, 0
        add_modrm(buffer, operands,
              3,
              7,
              operands[0].value)
      end

      def bytesize; 4; end
    }.new
    forms << Fisk::Machine::Form.new(operands, encodings)
    RDSEED = Fisk::Machine::Instruction.new("RDSEED", forms)
  end
end
