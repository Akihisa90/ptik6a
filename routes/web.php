<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CommentController;
use App\Models\Comment;

Route::get('/', function () {
    $comments = Comment::latest()->get();
    return view('landing', compact('comments'));
});

Route::post('/comments/store', [CommentController::class, 'store'])->name('comments.store');
