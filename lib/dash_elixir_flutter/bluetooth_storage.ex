defmodule DashElixirFlutter.BluetoothStorage do
  @persistent_dir "/data/bluetooth"
  @volatile_dir "/var/lib/bluetooth"

  def init_storage() do
    # Cria diretório persistente se não existir
    File.mkdir_p!(@persistent_dir)

    # Monta tmpfs em /var
    System.cmd("mount", ["-t", "tmpfs", "-o", "size=2M", "tmpfs", "/var"])

    # Cria estrutura de diretórios
    File.mkdir_p!(@volatile_dir)

    # Restaura backup
    System.cmd("cp", ["-a", "#{@persistent_dir}/.", "#{@volatile_dir}/"])
  end

  def persist_storage() do
    if File.dir?(@volatile_dir) do
      # Limpa o diretório persistente primeiro
      System.cmd("rm", ["-rf", "#{@persistent_dir}/*"])

      # Copia os arquivos (preservando atributos com -a)
      System.cmd("cp", ["-a", "#{@volatile_dir}/.", @persistent_dir])
    end
  end
end
