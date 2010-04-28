function highlight_dir( dir )
    s = what(dir);
    m_files = s.m;
    for i = 1 : length(m_files)
        m_file = [dir '/' m_files{i}]
        tex_file = strrep(m_file, '.m', '.tex')
        highlight(m_file, 'tex', tex_file);
    end
end
