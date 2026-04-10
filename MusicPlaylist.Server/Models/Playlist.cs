namespace MusicPlaylist.Server.Models;

public class Playlist
{
    public int Id { get; set; }
    public string Title { get; set; }

    // Navigation property
    public List<Track> Tracks { get; set; }
}