<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store(Request $request)
    {
        try {
            // Log the incoming request for debugging
            \Log::info('Comment request received', [
                'name' => $request->get('name'),
                'email' => $request->get('email'),
                'message' => $request->get('message'),
                'headers' => $request->headers->all()
            ]);

            // Validate input - trim whitespace
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'nullable|email|max:255',
                'message' => 'required|string'
            ]);

            // Create comment
            $comment = Comment::create($validated);

            // Check if AJAX request or expects JSON
            if ($request->wantsJson() || $request->header('X-Requested-With') === 'XMLHttpRequest') {
                return response()->json([
                    'success' => true,
                    'message' => 'Komentar berhasil ditambahkan',
                    'name' => $comment->name,
                    'email' => $comment->email
                ], 200);
            }

            // Redirect back with success message for normal form submission
            return redirect()->back()->with('success', 'Pesan Anda telah disimpan!');
        } catch (\Illuminate\Validation\ValidationException $e) {
            \Log::error('Validation error', ['errors' => $e->errors()]);
            
            if ($request->wantsJson() || $request->header('X-Requested-With') === 'XMLHttpRequest') {
                return response()->json([
                    'success' => false,
                    'errors' => $e->errors()
                ], 422);
            }
            throw $e;
        } catch (\Exception $e) {
            \Log::error('Comment creation error', ['error' => $e->getMessage()]);
            
            if ($request->wantsJson() || $request->header('X-Requested-With') === 'XMLHttpRequest') {
                return response()->json([
                    'success' => false,
                    'message' => 'Terjadi kesalahan: ' . $e->getMessage()
                ], 500);
            }
            throw $e;
        }
    }

    public function getComments()
    {
        return Comment::latest()->get();
    }
}
