import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/bloc/playlist_bloc.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/models/playlist.dart';
import 'package:spotify_clone/state/playlist_state.dart';

class PlaylistSong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<PlaylistBloc>(context),
        builder: (context, state) {
          if (state is PlaylistUninitializedState) {
            return buildSliverList(null);
          } else if (state is PlaylistEmptyState) {
            return buildSliverList(null);
          } else if (state is PlaylistErrorState) {
            return buildSliverList(null);
          } else if (state is PlaylistFetchingState) {
            return buildSliverList(null);
          } else {
            final stateAsPlayerFetchedState = state;
            final playlist = stateAsPlayerFetchedState.playlist;
            return buildSliverList(playlist);
          }
        });
  }

  Widget buildSliverList(Playlist playlist) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
              color: primaryColor,
              height: 60.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                    children: index == 0
                        ? ([
                            Text(number),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(child: Text(title), flex: 2),
                            Expanded(child: Text(album), flex: 2),
                            Expanded(child: Text(date), flex: 2),
                            Expanded(
                                child: Icon(
                                  duration,
                                  color: textColor,
                                ),
                                flex: 1),
                          ])
                        : ([
                            Text(index.toString()),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        child: Image.network(
                                          playlist == null
                                              ? kurtCobain
                                              : playlist.tracks.items[index]
                                                  .track.album.images[2].url,
                                          fit: BoxFit.contain,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes
                                                    : null,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(playlist
                                        .tracks.items[index].track.name),
                                  ],
                                ),
                                flex: 2),
                            Expanded(
                                child: Text(playlist
                                    .tracks.items[index].track.album.name),
                                flex: 2),
                            Expanded(child: Text("May 16, 2021"), flex: 2),
                            Expanded(child: Center(child: Text("4:20")))
                          ])),
              ));
        },
        childCount: playlist != null ? playlist.tracks.total : 0,
      ),
    );
  }
}
